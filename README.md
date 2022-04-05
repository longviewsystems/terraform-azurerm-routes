# Solution Description
This solution creates a default & custom route tables and routes on Azure with terraform codes.

# References:
* [Azure Route Table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table)
* [Azure Route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route)

# Notes
Change variable values under /tf/terraform.tfvars file as needed. 

# Usage
To trigger a CI build in Github Actions, submit a PR to the dev/feature branch.

To trigger terratest in the local environment:
```bash
$ cd test
$ make azdo-agent-test
```

To deploy to an Azure tenant:
```bash
$ make azdo-agent
```

To destroy the infra in the Azure tenant:
```bash
$ cd test
$ make destroy
```

To cleanup the TF configuration files in your local dev env:
```bash
$ cd test
$ make clean
```

---------------

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route.custom_routes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route.default_routes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.custom_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_route_table.default_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_disable_bgp_route_propagation"></a> [custom\_disable\_bgp\_route\_propagation](#input\_custom\_disable\_bgp\_route\_propagation) | Option to disable BGP route propagation on this Route Table. | `string` | `"true"` | no |
| <a name="input_custom_next_hop_in_dynamic_private_ip"></a> [custom\_next\_hop\_in\_dynamic\_private\_ip](#input\_custom\_next\_hop\_in\_dynamic\_private\_ip) | (Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall | `string` | `null` | no |
| <a name="input_custom_next_hop_in_ip_address"></a> [custom\_next\_hop\_in\_ip\_address](#input\_custom\_next\_hop\_in\_ip\_address) | Contains the IP address packets should be forwarded to | `string` | `null` | no |
| <a name="input_custom_route_address_prefixes"></a> [custom\_route\_address\_prefixes](#input\_custom\_route\_address\_prefixes) | The Route Address prefixes. | `list(string)` | `[]` | no |
| <a name="input_custom_route_names"></a> [custom\_route\_names](#input\_custom\_route\_names) | (Required) custom route table object to be created. | `list(string)` | `[]` | no |
| <a name="input_custom_route_nexthop_types"></a> [custom\_route\_nexthop\_types](#input\_custom\_route\_nexthop\_types) | The type of Azure hop the packet should be sent to. | `list(string)` | `[]` | no |
| <a name="input_custom_route_table_name"></a> [custom\_route\_table\_name](#input\_custom\_route\_table\_name) | The name of the RouteTable being created. | `string` | n/a | yes |
| <a name="input_default_disable_bgp_route_propagation"></a> [default\_disable\_bgp\_route\_propagation](#input\_default\_disable\_bgp\_route\_propagation) | Option to disable BGP route propagation on this Route Table. | `string` | `"true"` | no |
| <a name="input_default_next_hop_in_dynamic_private_ip"></a> [default\_next\_hop\_in\_dynamic\_private\_ip](#input\_default\_next\_hop\_in\_dynamic\_private\_ip) | (Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall | `string` | `null` | no |
| <a name="input_default_next_hop_in_ip_address"></a> [default\_next\_hop\_in\_ip\_address](#input\_default\_next\_hop\_in\_ip\_address) | Contains the IP address packets should be forwarded to | `string` | `null` | no |
| <a name="input_default_route_address_prefixes"></a> [default\_route\_address\_prefixes](#input\_default\_route\_address\_prefixes) | The Route Address prefixes. | `list(string)` | `[]` | no |
| <a name="input_default_route_names"></a> [default\_route\_names](#input\_default\_route\_names) | (Required) default route table object to be created. | `list(string)` | `[]` | no |
| <a name="input_default_route_nexthop_types"></a> [default\_route\_nexthop\_types](#input\_default\_route\_nexthop\_types) | The type of Azure hop the packet should be sent to. | `list(string)` | `[]` | no |
| <a name="input_default_route_table_name"></a> [default\_route\_table\_name](#input\_default\_route\_table\_name) | The name of the RouteTable being created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Location where RG is created | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource group | `string` | `"rg-demo-westeurope-01"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(any)` | <pre>{<br>  "environment": "test",<br>  "managed_by": "terratest"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_route_id"></a> [custom\_route\_id](#output\_custom\_route\_id) | Returns the ID of the created route table |
| <a name="output_custom_route_table_name"></a> [custom\_route\_table\_name](#output\_custom\_route\_table\_name) | Returns the name of the created route table |
| <a name="output_custom_route_table_object"></a> [custom\_route\_table\_object](#output\_custom\_route\_table\_object) | Returns the full object of the created route table |
| <a name="output_default_route_id"></a> [default\_route\_id](#output\_default\_route\_id) | Returns the ID of the created route table |
| <a name="output_default_route_table_name"></a> [default\_route\_table\_name](#output\_default\_route\_table\_name) | Returns the name of the created route table |
| <a name="output_default_route_table_object"></a> [default\_route\_table\_object](#output\_default\_route\_table\_object) | Returns the full object of the created route table |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
