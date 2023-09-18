SHELL := /bin/bash

init:
	cd terraform && terraform init

apply:
	. .profile && cd terraform && terraform apply -auto-approve

validate:
	. .profile && cd terraform && terraform validate

destroy:
	. .profile && cd terraform && terraform destroy -auto-approve

plan:
	. .profile && cd terraform && terraform plan
