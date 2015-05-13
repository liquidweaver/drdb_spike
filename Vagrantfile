# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.define "alice" do |alice|
    alice.vm.hostname = "alice"
    alice.vm.network "private_network", ip: "172.22.33.10"
    alice.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
        unless File.exist?('alice_disk1.vdi')
          vb.customize ['createhd', '--filename', 'alice_disk1', '--variant', 'Fixed', '--size', 5 * 1024]
        end

          vb.customize ['storageattach', :id,  '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'alice_disk1.vdi']
    end
  end

  config.vm.define "bob" do |bob|
    bob.vm.hostname = "bob"
    bob.vm.network "private_network", ip:  "172.22.33.11"
    bob.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
        unless File.exist?('bob_disk1.vdi')
          vb.customize ['createhd', '--filename', 'bob_disk1', '--variant', 'Fixed', '--size', 5 * 1024]
        end

          vb.customize ['storageattach', :id,  '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'bob_disk1.vdi']
    end
  end

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
