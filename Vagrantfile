# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo Provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |conf|
  conf.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
  conf.vm.hostname = "postgresql-8.4"
end

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu2204"
  config.vm.provision "shell", inline: $script

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.force_remote_user = "false"
  end
  # PostgreSQL port forwarding
  config.vm.forward_port 5432, 15432
end
