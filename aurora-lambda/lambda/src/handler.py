import os
import json
import boto3
import pg8000


secrets_client = boto3.client("secretsmanager")


def lambda_handler(event, context):

    connection = None
    cursor = None

    try:
        # Retrieve database credentials from Secrets Manager
        secret_response = secrets_client.get_secret_value(
            SecretId=os.environ["DB_SECRET_ARN"]
        )

        credentials = json.loads(secret_response["SecretString"])

        # Connect to Aurora PostgreSQL
        connection = pg8000.connect(
            host=os.environ["DB_HOST"],
            port=int(os.environ["DB_PORT"]),
            database=os.environ["DB_NAME"],
            user=credentials["username"],
            password=credentials["password"],
            ssl_context=True
        )

        cursor = connection.cursor()

        # Execute a test query
        cursor.execute(
            "SELECT current_database(), version()"
        )

        result = cursor.fetchone()

        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Successfully connected to Aurora PostgreSQL",
                "database": result[0],
                "version": result[1]
            })
        }

       finally:
        try:
            if cursor is not None:
                cursor.close()
        finally:
            if connection is not None:
                connection.close()
