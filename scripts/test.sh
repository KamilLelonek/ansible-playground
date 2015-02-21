#!/bin/bash

ansible-playbook playbooks/main.yml -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant $@
