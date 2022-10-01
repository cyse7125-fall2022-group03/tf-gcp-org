data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}


# Create the project
resource "google_project" "project" {
  name       = var.project_id
  project_id = var.project_id
  org_id     = var.org_id
  billing_account = data.google_billing_account.acct.id
  
}

# data "google_iam_policy" "admin" {
#   binding {
#     role = "roles/iam.serviceAccounts.create"

#     members = [
#       "user:sandeepbharatwagh26@gmail.com",
#     ]
#   }
# }




# Use `gcloud` to enable:
# - serviceusage.googleapis.com
# # - cloudresourcemanager.googleapis.com
# resource "null_resource" "enable_service_usage_api" {
#   provisioner "local-exec" {
#     command = "gcloud services enable serviceusage.googleapis.com cloudresourcemanager.googleapis.com --project ${var.project_id}"
#   }

#   depends_on = [google_project.project]
# }

# Wait for the new configuration to propagate
# # (might be redundant)
# resource "time_sleep" "wait_project_init" {
#   create_duration = "60s"

#   depends_on = [null_resource.enable_service_usage_api]
# }

# Enable other services used in the project
# resource "google_project_service" "services" {
#   for_each = toset(var.services)

#   project                    = var.project_id
#   service                    = each.key
#   disable_dependent_services = false
#   disable_on_destroy         = false

#   depends_on = [time_sleep.wait_project_init]
# }

#Create Service Account any append to project
# resource "google_service_account" "default" {
#   account_id   = "${format("%s","${var.service-name}-${var.project_id}")}"
#   display_name = "GKE Service Account"
# }



# Enable services in newly created GCP Project.
resource "google_project_service" "gcp_services" {
  count   = length(var.project_services)
  project = var.project_id
  service = var.project_services[count.index]

  disable_dependent_services = true
}