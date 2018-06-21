# terraform-azurerm-webapp
Terraform Azure RM WebApp Module

# Terraform module for Azure WebApp

> Deploy a web app on Azure with minimal configuration

## Features

- Create resource group, service plan and web app automatically
- Use `name` for all created resources by default, allowing custom values to be defined
- Customize web service plan and application settings

## Usage


Deploy a webapp with default settings:

```
module "linuxwebapp" {
    source              = "rahulkhengare/webapp/azurerm"
    name                = "testmelinuxwebapp"
    resource_group_name = "testwebappRG"
}

Outputs:
site_url = https://testmelinuxwebapp.azurewebsites.net
name    = testmelinuxwebapp
```

Deploy a webapp with customize web service plan settings
```
module "linuxwebapp" {
    source              = "rahulkhengare/webapp/azurerm"
    name                = "testmelinuxwebapp"
    resource_group_name = "testwebappRG"
    plan_settings       = {
                             kind     = "Linux" # Linux or Windows
                             size     = "S2"
                             capacity = 1
                             tier     = "Standard"
                          }
}

Outputs:
site_url = https://testmelinuxwebapp.azurewebsites.net
name    = testmelinuxwebapp
```


Deploy a webapp with Java Environment

```
module "linuxwebapp" {
    source              = "rahulkhengare/webapp/azurerm"
    name                = "testmelinuxwebapp"
    resource_group_name = "testwebappRG"
    site_config         = {
                            java_version           = "1.8"
                            java_container         = "JETTY"
                            java_container_version = "9.3"
                          }
}

Outputs:
site_url = https://testmelinuxwebapp.azurewebsites.net
name    = testmelinuxwebapp
```


## Changelog

### `v0.1.0`

- Removed Default site_config settings as it gives permission error after site deployment for .NET environment 

## License

[MIT](./LICENSE) © [Rahul Khengare](https://www.linkedin.com/in/rahulkhengare)
