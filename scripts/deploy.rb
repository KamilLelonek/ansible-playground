#!/usr/bin/env ruby

ARGV[0] ||= 'main'
system "ansible-playbook -i hosts playbooks/#{ARGV[0]}.yml -u root #{ARGV.drop(1).join(' ')}"
