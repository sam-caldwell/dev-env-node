start:
	localstack start --host-dns -d

stop:
	@localstack stop || true
	@echo 'stopped'

clean: stop
	@rm -f ~/.localstack/data
	@echo 'clean'

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

deploy: terraform-apply
	# ToDo: add other steps here if needed.