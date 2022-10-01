# tf-gcp-org

| Name                | NUID      | Email                           |
| ------------------- | --------- | ------------------------------- |
| Ketki Kule          | 001549838 | kule.k@northeastern.edu         |
| Sandeep Wagh        | 001839964 | wagh.sn@northeastern.edu        |
| Vignesh Gunasekaran | 001029530 | gunasekaran.v@northeastern.edu  |

## Requirements

Repo contains terraform files to create organization in Google Cloud Project

### Steps to run terraform 

Run the following command in your shell to login to google cloud:

```sh
gcloud auth login
```
This will open a new window in the browser asking for google login credentials

Run the following command to run initialize terraform files

```
terraform init
```

Run the following command to verify the terraform plan

```
terraform plan
```

Run the following command to run the terraform file for creating resources

```
terraform apply
```