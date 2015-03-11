#!/usr/bin/env ruby

playbook = ARGV[0] || 'main'
system "ansible-playbook -i hosts playbooks/#{playbook}.yml -u root $@"
