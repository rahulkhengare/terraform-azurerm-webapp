# terraform-azurerm-webapp
Terraform Azure RM WebApp Module

# Terraform module for Azure WebApp

> Deploy a web app on Azure with minimal configuration

## Features

- Create resource group, service plan and web app automatically
- Use `name` for all created resources by default, allowing custom values to be defined
- Customize web service plan and application settings

## Usage


Deploy a function app in consumption plan with git deployment enabled:

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

## Changelog

## License

[MIT](./LICENSE) © [Rahul Khengare](https://www.linkedin.com/in/rahulkhengare)
