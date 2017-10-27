output "database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = "${azurerm_sql_database.db.name}"
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL server."
  value       = "${var.db_server_fqdn}"
}

output "connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = "Server=tcp:${var.db_server_fqdn},1433;Initial Catalog=${azurerm_sql_database.db.name};Persist Security Info=False;User ID=${var.sql_admin_username};Password=${var.sql_admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

output "log" {
  description = "Seed log"
  value       = "${file("${var.log_file}")}"
}
