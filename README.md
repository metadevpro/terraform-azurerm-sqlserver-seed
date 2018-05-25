# Create an Azure SQL Server Database with a SQL script initialization

This **Terraform module** creates an SQL Server Database on Azure allowing to execute a SQL script to setup and initialize the database such as: users, schemas and data.

The database **server** must be created beforehand. This module is not going to create the server if does not exist, it will only create the database plus initialization.

## Prerequisites

This module uses the tool `slqcmd` as a local provisioner to connect and inject the SQL initialization.

Therefore, the following dependencies must be installed beforehand on your machine:

1. Microsoft [OBDC Driver 13.1](https://www.microsoft.com/en-us/download/details.aspx?id=53339).
2. Install the Microsoft [sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility) utility.

## Usage

```hcl
module "azurerm_sql_sever_init" {
  source             = "Azure/database-seed/azurerm"
  location           = "westeurope"
  resource_group     = "myresourcegroup007"
  db_server_fqdn     = "${azurerm_sql_server.db1.fully_qualified_domain_name}"
  sql_admin_username = "${azurerm_sql_server.db1.administrator_login}"
  sql_admin_password = "${azurerm_sql_server.db1.administrator_login_password}"
  db_name             = "mydatabase"
  init_script_file    = "mydatabase.init.sql"
  log_file            = "mydatabase.init.log"

  tags = {
    environment = "qa"
    project     = "acme"
    provisioner = "terraform"
  }
}
```
## License

Apache v. 2.0

## Authors

[Pedro J. Molina, PhD.](https://github.com/pjmolina) @ [Metadev](https://metadev.pro)
