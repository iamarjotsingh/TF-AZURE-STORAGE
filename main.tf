terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "amar_rg"
    storage_account_name = "amarjotstorage1"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = var.base_name_rg
  location = var.location_rg
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = var.base_name_sa
  resource_group_name = module.ResourceGroup.rg_name_out
  location = var.location_sa
}