location    = "francecentral"
global_name = "t-clo-901-mpl-0"

nsg_security_rule = {
  "HTTP-HTTPS" = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp",
    source_port_range          = "*",
    destination_port_ranges    = ["80", "443"],
    source_address_prefix      = "Internet",
    destination_address_prefix = "20.203.64.7"
  }

}

lb_rules = {
  "lb" = {
    backend_port  = 443
    frontend_port = 443
    protocol      = "Tcp"
  }
}

vm_config = {
  "master" = {
    size         = "Standard_A4_v2"
    username     = "azureuser"
    storage_type = "Standard"
  }
  "worker" = {
    size         = "Standard_A4_v2"
    username     = "azureuser"
    storage_type = "Standard"
  }
}
