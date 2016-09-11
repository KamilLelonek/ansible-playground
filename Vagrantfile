# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/centos-7.2'

  # DNS
  config.dns.tld     = 'vm'
  config.vm.hostname = 'ansible'

  # Networking
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: '192.168.33.15'

  # Provisioning
  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbooks/main.yml'
    ansible.groups   = { 'ansible' => %w(default) }
  end
end
