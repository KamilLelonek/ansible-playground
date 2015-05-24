# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/centos-7.1'

  # DNS
  config.dns.tld              = 'company'
  config.vm.hostname          = 'example'
  VagrantDNS::Config.auto_run = true

  # Networking
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: '192.168.33.15'

  # Provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbooks/main.yml'
    ansible.groups   = { 'example' => %w(default) }
  end
end
