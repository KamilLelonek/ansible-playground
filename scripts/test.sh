#!/bin/bash

ansible-playbook playbooks/main.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=~/.vagrant.d/insecure_private_key -u vagrant $@
