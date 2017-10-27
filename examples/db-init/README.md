# Example: SQL Server DB creation and initialization

This script creates in Azure:

- A Resource Group
- A SQL Server DB
- Then uses the module to:
    - Create a database
    - Initialize the DB with a script


## Usage

1. Edit main.tf to setup your Azure credentials.
2. Execute:

```
    terraform init
    terraform get
    terraform plan
    terraform apply
```

Note that this example will create Azure resources which cost money.
Finally, run:

```
    terraform destroy -force
```  

when you don't need these resources to destroy them.