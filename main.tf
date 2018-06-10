provider "azurerm" {
  version = ">= 1.6.0"
}

terraform {
  required_version = ">= 0.11.0"
}

resource "azurerm_resource_group" "webapp" {
  name     = "${var.resource_group_name == "" ? replace(var.name, "/[^a-z0-9]/", "RG") : var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "webserviceplan" {
  name                = "${var.service_plan_name == "" ? replace(var.name, "/[^a-z0-9]/", "") : var.service_plan_name}"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  
  kind                = "${var.plan_settings["kind"]}"
  
  sku {
    tier     = "${var.plan_settings["tier"]}"
    size     = "${var.plan_settings["size"]}"
    capacity = "${var.plan_settings["capacity"]}"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "${var.name}"
  location            = "${azurerm_resource_group.webapp.location}"
  resource_group_name = "${azurerm_resource_group.webapp.name}"
  app_service_plan_id = "${azurerm_app_service_plan.webserviceplan.id}"
  site_config         = "${var.site_config}"
  app_settings        = "${var.app_settings}"
}
