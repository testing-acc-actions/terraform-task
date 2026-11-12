$ErrorActionPreference = "Stop"

$LambdaDirectory = $PSScriptRoot
$SourceDirectory = Join-Path $LambdaDirectory "src"
$PackageDirectory = Join-Path $LambdaDirectory "package"
$ZipFile = Join-Path $LambdaDirectory "function.zip"

# Remove previous package
if (Test-Path $PackageDirectory) {
    Remove-Item $PackageDirectory -Recurse -Force
}

if (Test-Path $ZipFile) {
    Remove-Item $ZipFile -Force
}

# Create package directory
New-Item -ItemType Directory -Path $PackageDirectory | Out-Null

# Install Python dependencies
python -m pip install `
    -r (Join-Path $LambdaDirectory "requirements.txt") `
    -t $PackageDirectory

# Copy handler into ZIP root
Copy-Item `
    (Join-Path $SourceDirectory "handler.py") `
    $PackageDirectory

# Create Lambda ZIP
Compress-Archive `
    -Path "$PackageDirectory\*" `
    -DestinationPath $ZipFile

Write-Host "Lambda deployment package created successfully."
