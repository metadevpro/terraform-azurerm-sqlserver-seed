variable "location" {
  description = "Azure location where the db server is located."
}

variable "resource_group" {
  description = "Azure Resource Group name where the db server is located."
}

variable "db_server_fqdn" {
  description = "Full qualified domain name of the database sever. The server where to create the database. In the form xxxx.database.windows.net"
}

variable "db_name" {
  description = "The name of the database to be created."
}

variable "sql_admin_username" {
  description = "The administrator username of the SQL Server to use for launching the seed script."
}

variable "sql_admin_password" {
  description = "The administrator password of the SQL Server to use for launching the seed script."
}

variable "tags" {
  description = "The tags to associate with the database."
  type        = "map"

  default = {
    provisioner = "terraform"
  }
}

variable init_script_file {
  description = "SQL Script file name to seed the database. Example: db-init.sql."
}

variable log_file {
  description = "Log file name to create with the seeding results."
  default     = "db-init.log"
}

variable "collation" {
  description = "The collation for the database. Default is SQL_Latin1_General_CP1_CI_AS"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "db_edition" {
  description = "The edition of the database to be created."
  default     = "Basic"
}

variable "service_objective_name" {
  description = "The performance level for the database. For the list of acceptable values, see https://docs.microsoft.com/en-gb/azure/sql-database/sql-database-service-tiers. Default is Basic."
  default     = "Basic"
}
