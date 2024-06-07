terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "t-clo-902-mpl-1"
    storage_account_name = "atclo902mpl1848"
    container_name       = "statefile"
    key                  = "t-clo-902-mpl-1.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}
