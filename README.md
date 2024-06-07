## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dev_test_linux_virtual_machine.t-kubequest-loop](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_linux_virtual_machine) | resource |
| [azurerm_dev_test_lab.dev-test-t-kubequest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dev_test_lab) | data source |
| [azurerm_dev_test_virtual_network.t-kubequest-dev-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dev_test_virtual_network) | data source |
| [azurerm_resource_group.t-kubquest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_PRIVATE_KEY"></a> [PRIVATE\_KEY](#input\_PRIVATE\_KEY) | get private key from github | `any` | n/a | yes |
| <a name="input_PUBLIC_KEY"></a> [PUBLIC\_KEY](#input\_PUBLIC\_KEY) | get public key from github | `any` | n/a | yes |
| <a name="input_global_name"></a> [global\_name](#input\_global\_name) | name of the resource group | `string` | n/a | yes |
| <a name="input_last_available_ip"></a> [last\_available\_ip](#input\_last\_available\_ip) | last available ip for load balancer | `number` | `12` | no |
| <a name="input_lb_rules"></a> [lb\_rules](#input\_lb\_rules) | n/a | <pre>map(object({<br>    protocol      = string<br>    frontend_port = number<br>    backend_port  = number<br>  }))</pre> | n/a | yes |
| <a name="input_lb_sku_tier"></a> [lb\_sku\_tier](#input\_lb\_sku\_tier) | the SKU of the load balancer, please note that basic is not supported with backend addresses | `string` | `"Standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | location of the resource group | `string` | n/a | yes |
| <a name="input_nsg_security_rule"></a> [nsg\_security\_rule](#input\_nsg\_security\_rule) | n/a | <pre>map(object({<br>    priority                   = number<br>    direction                  = string<br>    access                     = string<br>    protocol                   = string<br>    source_port_range          = optional(string)<br>    destination_port_ranges    = optional(list(string)),<br>    source_address_prefix      = optional(string)<br>    destination_address_prefix = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_os_disk"></a> [os\_disk](#input\_os\_disk) | Configuration of disk for vmss | `object({ storage_account_type = string, caching = string })` | <pre>{<br>  "caching": "ReadWrite",<br>  "storage_account_type": "Standard_LRS"<br>}</pre> | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | n/a | `string` | `"Static"` | no |
| <a name="input_probe_settings"></a> [probe\_settings](#input\_probe\_settings) | setting of health probe | <pre>object({<br>    name     = optional(string),<br>    protocol = optional(string),<br>    port     = optional(number)<br>  })</pre> | <pre>{<br>  "name": "default",<br>  "port": 22,<br>  "protocol": "Tcp"<br>}</pre> | no |
| <a name="input_size"></a> [size](#input\_size) | default size of the vms | `string` | `"Standard_A4_v2"` | no |
| <a name="input_source_image_ref"></a> [source\_image\_ref](#input\_source\_image\_ref) | n/a | `object({ publisher = string, offer = string, sku = string, version = string })` | <pre>{<br>  "offer": "0001-com-ubuntu-server-focal",<br>  "publisher": "Canonical",<br>  "sku": "20_04-lts",<br>  "version": "latest"<br>}</pre> | no |
| <a name="input_subnet_prefix_address"></a> [subnet\_prefix\_address](#input\_subnet\_prefix\_address) | default prefix address for subnet | `string` | `"10.10.1.0/24"` | no |
| <a name="input_subnet_prefix_addresses"></a> [subnet\_prefix\_addresses](#input\_subnet\_prefix\_addresses) | default prefix address for subnet | `list(string)` | <pre>[<br>  "10.10.1.0/24"<br>]</pre> | no |
| <a name="input_vm_config"></a> [vm\_config](#input\_vm\_config) | name of the VMs | <pre>map(object({<br>    size         = string,<br>    username     = string,<br>    storage_type = string,<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
