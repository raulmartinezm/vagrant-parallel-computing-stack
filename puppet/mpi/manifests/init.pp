require 'json'

class mpi {
  resources { 'host': purge => true }

$cluster_hosts = split($hosts, ',')
$cluster_ips   = split($ips,',')

# Configure /etc/hosts 
  file { "hosts":
    path => "/etc/hosts",
    ensure => file,
    owner => "root",
    group => "root",
    mode => "0644",
    content => template("mpi/hosts.erb"),
  }

# Create mpi user
  user { "mpi":
    ensure     => "present",
    shell      => "/bin/bash",
  }

  package { "mpich2": ensure => "installed" }
}
