variable "project_id" {
  type    = string
  default = "csye712522"
}

variable "project" {
  description = "The project name"
  type        = string
  default     = "csye712522"
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
  default     = "370221421887"
}

variable "service-name" {
  description = "The service account name"
  type        = string
  default     = "service"
}

variable "project_services" {
  type = list(any)
  default = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}

variable "services" {
  type = list(any)
  default = [
    # List all the services you use here

  ]
}

variable "key-path" {
  description = "key path for service acc json"
  type        = string
  default     = "/Users/sandy/serviceacc.json"
}

variable "rolesList" {

  type = list(string)

  default = ["roles/storage.admin", "roles/pubsub.admin",
   "roles/resourcemanager.organizationAdmin",
   "roles/iam.securityAdmin",
   "roles/owner",
   "roles/editor",
   "roles/servicemanagement.admin",
   "roles/iam.serviceAccountKeyAdmin",
   "roles/compute.admin"]
}


