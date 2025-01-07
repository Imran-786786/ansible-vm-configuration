terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
   
  }
  backend "azurerm" {
    resource_group_name   = "Umar-B16-G18-RG"
    storage_account_name  = "umar16g18stg"
    container_name        = "imran"
    key                   = "dev.terraform.tfstate"
    
  }
}
provider "azurerm" {
  features {

  }
  subscription_id = "dfae4920-89de-4693-a1a4-95ff4eab4809"
}
