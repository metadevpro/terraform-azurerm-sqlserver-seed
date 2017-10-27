provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "g0" {
  name     = "samplegroup12345"
  location = "westeurope"
}

resource "azurerm_sql_server" "server0" {
  name                         = "sampledbserver0"
  resource_group_name          = "${azurerm_resource_group.g0.name}"
  location                     = "${azurerm_resource_group.g0.location}"
  version                      = "12.0"
  administrator_login          = "dbAdministrator"
  administrator_login_password = "P4ssw0rd!Acme"
}

resource "azurerm_sql_firewall_rule" "fw0" {
  name                = "SQLFirewallRule0"
  resource_group_name = "${azurerm_resource_group.g0.name}"
  server_name         = "${azurerm_sql_server.server0.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

module "dbseed" {
  source             = "../../"
  location           = "${azurerm_resource_group.g0.location}"
  resource_group     = "${azurerm_resource_group.g0.name}"
  db_server_fqdn     = "${azurerm_sql_server.server0.fully_qualified_domain_name}"
  sql_admin_username = "${azurerm_sql_server.server0.administrator_login}"
  sql_admin_password = "${azurerm_sql_server.server0.administrator_login_password}"
  db_name            = "db_sample"
  init_script_file   = "db.init.sql"
  log_file           = "db.init.log"

  tags = {
    environment = "qa3"
    project     = "acme/x"
    provisioner = "terraform"
  }
}
