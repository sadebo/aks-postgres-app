terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "mytfstateacct01"
    container_name       = "tfstate"
    key                  = "aks-postgres.terraform.tfstate"
  }
}
