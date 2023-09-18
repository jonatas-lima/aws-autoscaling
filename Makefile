SHELL := /bin/bash

init:
	cd terraform && terraform init

run:
	. .profile && cd terraform && terraform apply -auto-approve

destroy:
	. .profile && cd terraform && terraform destroy -auto-approve

plan:
	. .profile && cd terraform && terraform plan
