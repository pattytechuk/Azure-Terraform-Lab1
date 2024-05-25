# Configuring the microsoft azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG" {
  name     = "RG-AZ-700"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "CoreServicesVnet"
  location            = "East US"
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.20.0.0/16"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.20.0.0/27"
  }

  subnet {
    name           = "DatabaseSubnet"
    address_prefix = "10.20.20.0/24"
  }

  subnet {
    name           = "SharedServicesSubnet"
    address_prefix = "10.20.10.0/24"
  }

  subnet {
    name           = "PublicWebServiceSubnet"
    address_prefix = "10.20.30.0/24"
  }
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "ResearchVnet"
  location            = "Southeast Asia"
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.40.0.0/16"]

  subnet {
    name           = "ResearchSystemSubnet"
    address_prefix = "10.40.0.0/24"
  }
}

resource "azurerm_virtual_network" "vnet3" {
  name                = "ManufacturingVnet"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.30.0.0/16"]

  subnet {
    name           = "ManufacturingSystemSubnet"
    address_prefix = "10.30.10.0/24"
  }
  subnet {
    name           = "SensorSubnet1"
    address_prefix = "10.30.20.0/24"
  }
  subnet {
    name           = "SensorSubnet2"
    address_prefix = "10.30.21.0/24"
  }
  subnet {
    name           = "SensorSubnet3"
    address_prefix = "10.30.22.0/24"
  }
}
