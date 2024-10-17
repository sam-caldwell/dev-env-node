start:
	localstack start --host-dns -d

stop:
	@localstack stop || true
	@echo 'stopped'

clean: stop
	@rm -f ~/.localstack/data || true
	@rm -rf iac/terraform/.terraform || true
	@rm -f iac/terraform/.terraform.lock.hcl || true
	@rm -f iac/terraform/kubeconfig || true
	@rm -f iac/terraform/terraform.tfstate || true
	@rm -f iac/terraform/terraform.tfstate.backup || true
	@echo 'clean'

terraform-init:
	@( \
		cd iac/terraform && terraform init -upgrade; \
	)
terraform-plan: terraform-init
	@( \
		cd iac/terraform && \
		terraform plan \
	)

terraform-apply: terraform-init
	@( \
		cd iac/terraform && \
		terraform apply -auto-approve \
	)

deploy: terraform-apply
	# ToDo: add other steps here if needed.
