variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "korea central"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureuser"
}

variable "prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "K8S-DEV"
}

variable "hostname" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "k8s-w"
}
