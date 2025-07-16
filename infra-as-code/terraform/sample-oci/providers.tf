terraform {
  required_version = ">=1.5.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.4.0"
      configuration_aliases = [oci.home]
    }
  }
  backend "oci" {
    bucket            = "github-runner-tf-state"
    namespace         = "bmzal7j4q1ix"
    region            = "ap-mumbai-1"
    auth              = "InstancePrincipal"
    key               = "github-actions-demo/oci-tf-oss.tfstate"
  } 
}

provider "oci" {
  region = var.region
  auth = "InstancePrincipal"
}

provider "oci" {
  alias = "home"
  region = var.region
  auth = "InstancePrincipal"
}
