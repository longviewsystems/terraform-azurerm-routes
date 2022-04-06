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
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | > 2.99.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Location where RG is created | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource group | `string` | `"rg-demo-westeurope-01"` | no |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | Create Route Tables with routes | <pre>map(object({<br>    route_table_name              = string<br>    disable_bgp_route_propagation = string<br>    route_entries = map(object({<br>      route_name             = string<br>      address_prefix         = string<br>      next_hop_type          = string<br>      next_hop_in_ip_address = string<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(any)` | <pre>{<br>  "environment": "test",<br>  "managed_by": "terratest"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_route_table_id"></a> [custom\_route\_table\_id](#output\_custom\_route\_table\_id) | Return custom route table ID's created |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | Return default route table ID's created |
| <a name="output_route_ids"></a> [route\_ids](#output\_route\_ids) | Returns the ID of the created route table |
| <a name="output_route_table_names"></a> [route\_table\_names](#output\_route\_table\_names) | Returns the name of the created route tables |
| <a name="output_route_tables_object"></a> [route\_tables\_object](#output\_route\_tables\_object) | Returns the full object of the created route tables |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
