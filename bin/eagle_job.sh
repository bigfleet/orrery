#!/bin/bash
ansible-galaxy install -r roles/requirements.yml
if ${WORKSPACE_AZURE_DIRECTORY_BOUND}
then
  echo 'Logging in with SP'
  source <(grep = "${WORKSPACE_AZURE_DIRECTORY_PATH}"/credentials)
  az login --service-principal --username $client_id --password $secret --tenant $tenant
else
  echo 'Logging in with pod identity'
  az login --identity
fi

export ANSIBLE_VAULT_PASSWORD_FILE=/workspace/ansible-vault-directory/vaultpw 
ansible-playbook -e "rna_file=../rna.yml" -v $PARAM_EAGLE_JOB.yml