# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Number of hosts and CPU(s) per host.
num_nodes = 2
num_cpu_host = 2

# Select the name of the box that you prefer.
base_box = "ubuntu/trusty64"

# Memory
node_memory = 256

# Network
base_ip = "10.0.0."
ip_inc = 10

# Prepare some variables for puppet
hosts_info = Hash.new(0)
hosts = ""
ips   = ""

(1..num_nodes).each do |index|
  if index == 1
    hostname = "master"
  else
    hostname = "node#{index-1}"
  end

  ipv4 = ip_inc * index
  ip_address = "#{base_ip}#{ipv4}"

# strings for facter  
  hosts += "#{hostname},"
  ips   += "#{ip_address},"

  hosts_info[index] = [hostname, ip_address] 
end

# Start the configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  (1..num_nodes).each do |index|
     
    ipv4 = ip_inc * index
    ip_address = "#{base_ip}#{ipv4}"
 
    prov_args= {
      :facter => {
        "hosts" => hosts,
	"ips" => ips,
      }
    }
  	 
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = base_box
  
    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    # config.vm.box_url = "http://domain.com/path/to/above.box"
  
    # Configuration for each node in the cluster
    config.vm.define hosts_info[index].first do |node|
      node.vm.hostname = hosts_info[index].first
      node.vm.network  :private_network, ip: hosts_info[index].last

      # Configure memory for every node
      node.vm.provider "virtualbox" do |node|
        node.customize ["modifyvm", :id, "--memory", node_memory, "--cpus", num_cpu_host]
      end

      node.vm.provision :puppet, prov_args do |puppet|
        puppet.manifests_path = "puppet"
        puppet.module_path    = "puppet"
        puppet.manifest_file  = "init.pp"
	puppet.options        = "--verbose --debug"
      end
    end
  end
end
