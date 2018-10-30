variable "app_id"{
#description = "appid from az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{yours subscriptions}""
 default      = "a34afe09-eac8-4099-ac27-77058aa4da54"
}
variable "client_password"{
# description = "password from az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{yours subscriptions}"
 default      = "55bf85ad-aa93-49ef-83d6-bb8f5b2f908d"
}
variable "location" {
 description = "The location where resources will be created"
 default     = "westeurope"
}
variable "admin_user"{
 description = "admin user op vm's"
 default     = "pm"
}
variable "admin_password"{
 description = "password of amin user on vm's"
 default      = "pm112358gtxr"
}
variable "resource_group_name" {
 description = "The name of the resource group in which the resources will be created"
 default     = "myrg2"
}
variable "application_port" {
   description = "The port that you want to expose to the external load balancer"
   default     = 80
}

