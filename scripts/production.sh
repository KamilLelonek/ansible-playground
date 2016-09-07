#!/bin/bash

ansible-playbook -i hosts playbooks/main.yml -u root $@
