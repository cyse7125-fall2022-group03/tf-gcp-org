variable "project_id" {
  type    = string
  default = "csye-7125-team3"
}

variable "project" {
  description = "The project name"
  type        = string
  default     = "csye-7125"
}

variable "region" {
  description = "The region in which to create the VPC network"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "The zone in which to create the infrastructure"
  type        = string
  default     = "us-east1-b"
}

variable "org_id" {
  description = "The organization ID"
  type        = string
  default     = "1025277680562"
}

variable "service-name" {
  description = "The service account name"
  type        = string
  default     = "service"
}

variable "services" {
  type = list(any)
  default = [
    # List all the services you use here

  ]
}
