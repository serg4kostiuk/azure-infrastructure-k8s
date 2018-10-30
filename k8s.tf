resource "azurerm_resource_group" "myk8s" {
  name     = "myrg2"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "myk8s" {
  name                = "myk8s2"
  location            = "${azurerm_resource_group.myk8s.location}"
  resource_group_name = "${azurerm_resource_group.myk8s.name}"
  dns_prefix          = "acctestagent1"
  kubernetes_version  = "1.11.3"

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_F1s"
    os_type         = "Linux"
    os_disk_size_gb = 30
  
  }

  service_principal {
    client_id     = "${var.app_id}"
    client_secret = "${var.client_password}"
  }

  tags {
    Environment = "Production"
  }
}

