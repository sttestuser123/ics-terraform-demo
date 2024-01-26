
_ICS IaC Terraform Demo_

Github actions example of how to use the ICS IaC Scanner with Terraform.

Requires the ICS API key, ICS base_url, AWS Access Key and AWS Secret Access Key
to be stored in github secrets.

Once in place, update the Terraform variable "secure" to true or false. Setting
to true will cause the action to complete without warnings. Setting to false
will cause the pipeline to fail and generate outputs as Github artifacts

*Note*: Currently this relies on long term AWS credentials. This is not ideal, but
I dont currently have an environment with the Github OIDC provider enabled to 
authenticate using an IAM role to generate temporary security credentials.

See: https://github.com/aws-actions/configure-aws-credentials#OIDC for more detail.
