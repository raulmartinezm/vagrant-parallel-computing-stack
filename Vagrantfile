# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Number of virtual machines that will be start and provisioned
num_nodes = 2

# Select the name of the box that you prefer.
base_box = "wheezy64"

# Memory
node_memory = 256

# Path to shared directory between nodes
shared_dir = "/shared"

# Network
base_ip = "10.0.0."
ip_inc = 10



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  (1..num_nodes).each do |index|
     
    hostname = "parallelstack#{index}"
    ipv4 = ip_inc * index
    ip_address = "#{base_ip}#{ipv4}"
    prov_args = {
      :facter => {
        "ip_addr"      => ip_address,
        "join_ip"      => "#{base_ip}#{ip_inc}",
      }
    }
  	 
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = base_box
  
    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    # config.vm.box_url = "http://domain.com/path/to/above.box"
  
    # Configuration for each node in the cluster
    config.vm.define hostname do |node|
      node.vm.host_name = hostname
      node.vm.network  :private_network, ip: ip_address

      # Shared directory between all nodes. You can put MPI program here.
      node.vm.synced_folder "./shared", shared_dir

      # Configure memory for every node
      node.vm.provider "virtualbox" do |node|
        node.customize ["modifyvm", :id, "--memory", node_memory]
      end

      node.vm.provision :puppet, prov_args do |puppet|
        puppet.manifests_path = "puppet"
        puppet.module_path    = "puppet"
        puppet.manifest_file  = "init.pp"
      end
    end
  end
end
