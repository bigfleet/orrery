#!/bin/bash
az login --identity
export DEFAULT_ROLES_PATH=/workspace/directory/etc/ansible/roles
export ANSIBLE_VAULT_PASSWORD_FILE=/workspace/ansible-vault-directory/vaultpw 
ansible-playbook -e "rna_file=../rna.yml" -v $PARAM_EAGLE_JOB.yml