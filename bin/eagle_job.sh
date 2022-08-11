#!/bin/bash
az login --identity
ANSIBLE_VAULT_PASSWORD_FILE=/workspace/ansible-vault-directory/vaultpw ansible-playbook -e "rna_url=${PARAM_RNA_URL}" -v $PARAM_EAGLE_JOB.yml