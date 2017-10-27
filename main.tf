# provider "azurerm" {
#   subscription_id = "REPLACE-WITH-YOUR-SUBSCRIPTION-ID"
#   client_id       = "REPLACE-WITH-YOUR-CLIENT-ID"
#   client_secret   = "REPLACE-WITH-YOUR-CLIENT-SECRET"
#   tenant_id       = "REPLACE-WITH-YOUR-TENANT-ID"
# }

locals {
  db_server = "${split(".", var.db_server_fqdn)}"
}

resource "azurerm_sql_database" "db" {
  name                             = "${var.db_name}"
  location                         = "${var.location}"
  resource_group_name              = "${var.resource_group}"
  server_name                      = "${local.db_server[0]}"
  edition                          = "${var.db_edition}"
  collation                        = "${var.collation}"
  requested_service_objective_name = "${var.service_objective_name}"
  create_mode                      = "Default"

  provisioner "local-exec" {
    command = "sqlcmd -U ${var.sql_admin_username} -P ${var.sql_admin_password} -S ${var.db_server_fqdn} -d ${var.db_name} -i ${var.init_script_file} -o ${var.log_file}"
  }
}
