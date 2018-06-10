# ###############
# required values
# ###############

variable "name" {
  description = "The name of the web app"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
}

# ###############
# optional values
# ###############

variable "location" {
  description = "Region where the resources are created."
  default     = "eastus"
}

variable "plan_settings" {
  type        = "map"
  description = "Definition of the dedicated plan to use"

  default = {
    kind     = "Linux" # Linux or Windows
    size     = "S1"
    capacity = 1
    tier     = "Standard"
  }
}

variable "service_plan_name" {
  description = "The name of the App Service Plan, default = $web_app_name"
  default     = ""
}

variable "app_settings" {
  description = "A key-value pair of App Settings"
  default     = {}
}

variable "site_config" {
  description = "A key-value pair for Site Config"
  type        = "list"

  default = [{
    always_on = true
    dotnet_framework_version = "v4.0"
    scm_type                 = "None"
  }]
}
