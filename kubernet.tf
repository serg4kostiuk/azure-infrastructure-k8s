provider "azurerm" {
   subscription_id = "a14fb91a-5f46-4afc-879a-4918d7def1c5"
   client_id       = "1cb0b69c-6087-49c0-8c5e-ddde2acfbc7a"
   client_secret   = "e677bee9-fb46-499d-9ed6-a369f025bb3c"
   tenant_id       = "22a6cb29-942b-44fc-abd1-03aa3af1c4f9"
}

resource "azurerm_resource_group" "kubernet" {
  name     = "kubernetes"
  location = "West Europe"
}

#resource azurerm_network_security_group "test_advanced_network" {
#  name                = "akc-1-nsg"
#  location            = "${azurerm_resource_group.kubernet.location}"
#  resource_group_name = "${azurerm_resource_group.kubernet.name}"
#}

#resource "azurerm_virtual_network" "test_advanced_network" {
#  name                = "akc-1-vnet"
#  location            = "${azurerm_resource_group.kubernet.location}"
#  resource_group_name = "${azurerm_resource_group.kubernet.name}"
#  address_space       = ["10.1.0.0/16"]
#}

#resource "azurerm_subnet" "test_subnet" {
#  name                      = "akc-1-subnet"
#  resource_group_name       = "${azurerm_resource_group.kubernet.name}"
#  network_security_group_id = "${azurerm_network_security_group.test_advanced_network.id}"
#  address_prefix            = "10.1.0.0/24"
#  virtual_network_name      = "${azurerm_virtual_network.test_advanced_network.name}"
#}

resource "azurerm_kubernetes_cluster" "kubernet" {
  name       = "mysql-cluster"
  location   = "${azurerm_resource_group.kubernet.location}"
  dns_prefix = "akc"
  resource_group_name = "${azurerm_resource_group.kubernet.name}"

  linux_profile {
    admin_username = "tester"

    ssh_key {
      key_data = "${file("/home/lv-345.cloudops/.ssh/id_rsa.pub")}"
    }
  }

  agent_pool_profile {
    name    = "mysqlnode"
    count   = "1"
    vm_size = "Standard_F1s"
    os_type = "Linux"
    os_disk_size_gb = 30

 #   vnet_subnet_id = "${azurerm_subnet.kubernet_subnet.id}"
  }

  service_principal {
    client_id     = "222bf2ae-98a9-4cbc-bce8-ae25e775f5db"
    client_secret = "2a2e0b28-d3cb-4800-992c-316fc9be3c31"
  }

#  network_profile {
#    network_plugin = "azure"
#  }

  tags {
        Environment = "Develop"
  }

}
