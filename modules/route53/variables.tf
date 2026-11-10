variable "hosted_zone_id" {
  description = "ID of the existing Route 53 hosted zone"
  type        = string
}

variable "record_name" {
  description = "DNS record name, such as app.example.com"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  type        = string
}
