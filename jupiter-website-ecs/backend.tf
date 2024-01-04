terraform {
  backend "s3" {
    bucket    = "YOUR-BUCKET-NAME"
    key       = "YOUR-KEY-VALUE"
    region    = "YOUR-REGION"
    profile   = "YOUR-PROFILE-NAME"
  }
}
