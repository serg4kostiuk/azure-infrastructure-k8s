output "id" {
    value = "${azurerm_kubernetes_cluster.myk8s.id}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.myk8s.kube_config_raw}"
}

output "client_key" {
  value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.client_key}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.cluster_ca_certificate}"
}

output "host" {
  value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.host}"
}


/*
output "azurevm-ss_public_ip001" {
    value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.dns_service_ip}"
}

output "azurevm-ss_public_ip002" {
    value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.docker_bridge_cidr}"
}

output "azurevm-ss_public_ip003" {
    value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.pod_cidr}"
}

output "azurevm-ss_public_ip004" {
    value = "${azurerm_kubernetes_cluster.myk8s.kube_config.0.ip_address}"
}




output "public_ip_id" {
    description = "id of the public ip address provisoned."
    value = "${azurerm_lb.demo02group.*.id}"
}

output "public_ip_loadbalancer_id" {
    description = "id of the availability set where the vms are provisioned."
    value = "${azurerm_lb.demo02group.id}"
}

output "azurevm-ss_public_ip002" {
    value = "${azurerm_lb_backend_address_pool.demo02group.id}"
}

output "azurevm-ss_public_ip003" {
    value = "${azurerm_lb_nat_pool.demo02group.*.id}"
}
*/