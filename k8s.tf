resource "azurerm_resource_group" "myk8s" {
  name     = "myrg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "myk8s" {
  name                = "myk8s"
  location            = "${azurerm_resource_group.myk8s.location}"
  resource_group_name = "${azurerm_resource_group.myk8s.name}"
  kubernetes_version  = "1.11.3"
  dns_prefix          = "acctestagent1"

  linux_profile {
    admin_username = "serg"

    ssh_key {
      key_data = "${file("~/.ssh/id_rsa.pub")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_F1s"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  tags {
    Environment = "Production"
  }
}


