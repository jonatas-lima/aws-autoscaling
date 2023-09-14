SHELL := /bin/bash

init:
	cd terraform && terraform init

run:
	cd terraform && terraform apply -auto-approve

destroy:
	cd terraform && terraform destroy -auto-approve
