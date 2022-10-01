data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}


# Create the project
resource "google_project" "project" {
  name            = var.project_id
  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = data.google_billing_account.acct.id

}

resource "google_organization_policy" "serial_port_policy" {
  org_id     = var.org_id
  constraint = "compute.skipDefaultNetworkCreation"
  boolean_policy { enforced = true }
}

resource "time_sleep" "wait_project_init" {
  create_duration = "120s"
  depends_on = [google_project.project]
}


resource "google_project_service" "gcp_services" {
  count   = length(var.project_services)
  project = var.project_id
  service = var.project_services[count.index]

  disable_dependent_services = true

  depends_on = [time_sleep.wait_project_init]
}

#Create Service Account any append to project
resource "google_service_account" "default" {
  account_id   = format("%s", "${var.service-name}-${var.project_id}")
  display_name = "GKE Service Account"
  depends_on   = [google_project_service.gcp_services]
}

resource "google_project_iam_binding" "cloudsql-sa-cloudsql-admin-role" {


  count = length(var.rolesList)
  role  = var.rolesList[count.index]
  members = [
    "serviceAccount:${google_service_account.default.email}",
    "user:${var.emailacc}",

  ]
  project    = var.project
  depends_on = [google_service_account.default]

}
resource "google_service_account_key" "mykey" {
  service_account_id = format("%s", "${var.service-name}-${var.project_id}")
  public_key_type    = "TYPE_X509_PEM_FILE"

  depends_on = [google_project_iam_binding.cloudsql-sa-cloudsql-admin-role]
}



resource "local_file" "myaccountjson" {
  content  = base64decode(google_service_account_key.mykey.private_key)
  filename = var.key-path

  depends_on = [google_service_account_key.mykey]


}
# Enable services in newly created GCP Project.
