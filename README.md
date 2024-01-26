
# ICS IaC Terraform Demo

Github actions example of how to use the ICS IaC Scanner with Terraform.

Requires the ICS API key, ICS base_url, AWS Access Key and AWS Secret Access Key
to be stored as Github Secrets.

AWS_ACCESS_KEY
AWS_SECRET_ACCESS_KEY
ICS_API_KEY
ICS_BASE_URL

Once in place, update the Terraform variable "secure" to true or false. Setting
to true will cause the action to complete without warnings. Setting to false
will cause the pipeline to fail and generate outputs as Github artifacts

Once updated, push to the remote repository, and the actions pipeline should execute.

**Note**: Currently this relies on long term AWS credentials. This is not ideal, but
I dont currently have an environment with the Github OIDC provider enabled to 
authenticate using an IAM role to generate temporary security credentials.

See [this link](https://github.com/aws-actions/configure-aws-credentials#OIDC) for more info.
