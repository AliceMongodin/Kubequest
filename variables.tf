variable "global_name" {
  type        = string
  description = "name of the resource group"
}

variable "vm_config" {
  type = map(object({
    size         = string,
    username     = string,
    storage_type = string,
  }))
  description = "name of the VMs"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "probe_settings" {
  description = "setting of health probe"
  type = object({
    name     = optional(string),
    protocol = optional(string),
    port     = optional(number)
  })
  default = {
    name     = "default",
    protocol = "Tcp",
    port     = 22
  }
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Static"
}

variable "lb_sku_tier" {
  type        = string
  description = "the SKU of the load balancer, please note that basic is not supported with backend addresses"
  default     = "Standard"
}

variable "lb_rules" {
  type = map(object({
    protocol      = string
    frontend_port = number
    backend_port  = number
  }))
}

#variable "subnet_datas" {
#  type        = any
#  description = "everything about the current subnet/vnet"
#} might not be needed since we have to create subnet and vnet

variable "nsg_security_rule" {
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = optional(string)
    destination_port_ranges    = optional(list(string)),
    source_address_prefix      = optional(string)
    destination_address_prefix = optional(string)
  }))
}

variable "last_available_ip" {
  type        = number
  description = "last available ip for load balancer"
  default     = 12
}

variable "subnet_prefix_address" {
  type        = string
  description = "default prefix address for subnet"
  default     = "10.10.1.0/24"
}

variable "subnet_prefix_addresses" {
  type        = list(string)
  description = "default prefix address for subnet"
  default     = ["10.10.1.0/24"]
}

#variable "vmss_sku" {
#  type        = string
#  description = "instance size of the vmss"
#  default     = "Standard_B2s" #this has 4gb & 2 CPU
#}

variable "os_disk" {
  type        = object({ storage_account_type = string, caching = string })
  description = "Configuration of disk for vmss"
  default = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

variable "size" {
  type        = string
  description = "default size of the vms"
  default     = "Standard_A4_v2"
}

variable "source_image_ref" {
  type = object({ publisher = string, offer = string, sku = string, version = string })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

variable "PRIVATE_KEY" {
  description = "get private key from github"
  sensitive   = true
}

variable "PUBLIC_KEY" {
  description = "get public key from github"
  sensitive   = true
}
