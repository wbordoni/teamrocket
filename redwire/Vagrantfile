# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Leader server
  config.vm.define "leader" do |leader|
    leader.vm.box = "centos/7"
    leader.vm.hostname = "leader.m2i.form"
    leader.vm.network "private_network", ip: "172.42.42.100"
    leader.vm.network "public_network", ip: "10.222.222.1"
    leader.vm.provider "virtualbox" do |v|
      v.name = "leader"
      v.memory = 3000
      v.cpus = 4
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end
    leader.vm.provision "shell", path: "bootstrap_leader.sh"
  end

    # nexus server
  config.vm.define "nexus" do |nexus|
    nexus.vm.box = "centos/7"
    nexus.vm.hostname = "nexus.m2i.form"
    nexus.vm.network "private_network", ip: "172.42.42.102"
    nexus.vm.network "public_network", ip: "10.222.222.2"
    nexus.vm.provider "virtualbox" do |v|
      v.name = "nexus"
      v.memory = 2048
      v.cpus = 2
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end
    nexus.vm.provision "shell", path: "bootstrap_nexus.sh"
  end


  # gitlab server
  config.vm.define "gitlab" do |gitlab|
    gitlab.vm.box = "centos/7"
    gitlab.vm.hostname = "gitlab.m2i.form"
    gitlab.vm.network "private_network", ip: "172.42.42.103"
    gitlab.vm.network "public_network", ip: "10.222.222.3"
    gitlab.vm.provider "virtualbox" do |v|
      v.name = "gitlab"
      v.memory = 2048
      v.cpus = 2
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end

    gitlab.vm.provision "shell", path: "bootstrap_gitlab.sh"
  end


  NodeCount = 3
  # Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.box = "centos/7"
      worker.vm.hostname = "worker#{i}.m2i.form"
      worker.vm.network "public_network", ip: "10.222.222.1#{i}"
      worker.vm.provider "virtualbox" do |v|
        v.name = "worker#{i}"
        v.memory = 1024
        v.cpus = 1
        # Prevent VirtualBox from interfering with host audio stack
        v.customize ["modifyvm", :id, "--audio", "none"]
      end
      worker.vm.provision "shell", path: "bootstrap_worker.sh"
    end
  end

end
