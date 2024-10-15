terraform-init:
	@( \
		cd iac && terraform init -upgrade; \
	)
terraform-plan: terraform-init
	@( \
		cd iac && \
		terraform plan -var='email=$(email_address)' \
	)

terraform-apply: terraform-init
	@( \
		cd iac && \
		terraform apply -auto-approve -var='email=$(email_address)' \
	)
