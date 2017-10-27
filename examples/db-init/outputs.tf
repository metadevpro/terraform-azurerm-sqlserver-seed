output "database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = "${module.dbseed.database_name}"
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL server."
  value       = "${module.dbseed.sql_server_fqdn}"
}

output "connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = "${module.dbseed.connection_string}"
}

output "log" {
  description = "Seed log"
  value       = "${module.dbseed.log}"
}
