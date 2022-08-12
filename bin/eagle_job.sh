#!/bin/bash
ansible-galaxy install -r roles/requirements.yml
az login --identity

export ANSIBLE_VAULT_PASSWORD_FILE=/workspace/ansible-vault-directory/vaultpw 
ansible-playbook -e "rna_file=../rna.yml" -v $PARAM_EAGLE_JOB.yml