#!/bin/bash

rm -rf ~/.ansible/roles/* && ansible-galaxy install -r roles/requirements.yml
ansible-playbook -v p0.yml