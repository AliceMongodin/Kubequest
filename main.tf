data "azurerm_resource_group" "t-kubequest" {
  name = var.global_name
}

data "azurerm_dev_test_lab" "dev-test-t-kubequest" {
  name                = var.global_name
  resource_group_name = data.azurerm_resource_group.t-kubequest.name
}

data "azurerm_dev_test_virtual_network" "t-kubequest-dev-vnet" {
  name                = var.global_name
  resource_group_name = data.azurerm_resource_group.t-kubequest.name
  lab_name            = data.azurerm_dev_test_lab.dev-test-t-kubequest.name
}
resource "azurerm_dev_test_linux_virtual_machine" "t-kubequest-loop" {
  for_each               = var.vm_config
  name                   = each.key
  lab_name               = data.azurerm_dev_test_lab.dev-test-t-kubequest.name
  resource_group_name    = data.azurerm_resource_group.t-kubequest.name
  location               = data.azurerm_resource_group.t-kubequest.location
  size                   = each.value.size
  username               = each.value.username
  ssh_key                = var.PUBLIC_KEY
  storage_type           = each.value.storage_type
  lab_virtual_network_id = data.azurerm_dev_test_virtual_network.t-kubequest-dev-vnet.id
  lab_subnet_name        = data.azurerm_dev_test_virtual_network.t-kubequest-dev-vnet.allowed_subnets[0].lab_subnet_name

  gallery_image_reference {
    publisher = var.source_image_ref["publisher"]
    offer     = var.source_image_ref["offer"]
    sku       = var.source_image_ref["sku"]
    version   = var.source_image_ref["version"]
  }
}


