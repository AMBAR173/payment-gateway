## Sandbox apply

Run the plan and apply from the `release/1.2` checkout. Terraform prompts for the
change number because `change_number` is required and is not stored in the code:

```powershell
terraform init
terraform plan -var="env=sandbox" -out=sandbox.tfplan
terraform apply sandbox.tfplan
```

When prompted, enter a value such as `CHG-12345`. The plan records that value, so
the apply uses the same approved change number. Do not commit the generated
`sandbox.tfplan` file.
