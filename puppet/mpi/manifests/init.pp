require 'json'

class mpi {

$cluster_hosts = split($hosts, ',')
$cluster_ips   = split($ips,',')

  file { "hosts":
    path => "/etc/hosts",
    ensure => file,
    owner => "root",
    group => "root",
    mode => "0644",
    content => template("mpi/hosts.erb"),
  }

  file { "machinefile":
    path => "/vagrant/machines",
    ensure => file,
    owner => "vagrant",
    group => "vagrant",
    mode => "0644",
    content => template("mpi/machinefile.erb"),
}

  ssh_authorized_key { 'insegure public key':
    user => 'vagrant',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDAf6bILSn8y5K46d7Ek5RwqMCRS4X4UhB0acXFch0UmHckverzdNk9LviqJvuTg8bDFnA95824KQFxdxfzH5Yh/vsM46+CUE+ovC6q8iQwozXg6fewdqMFyyZFogQ58/NLAW44NU/+bUrXA3/E00cjIk7Uj5PL3a+WxISqs+6OHGh1cNpTF0BPSLAgTVkSmtBdZ4Y5twQyh6qo8dWQxaRlyo6jOpBNcEII3RNbXPuueU4qjzNtOszBY9P43s1rznj+B0lAM49H+HGNaFK1Yk41T0xILvoTmkRAKVF3skBwPPQuVscKQRES+NHNp9WkHTdT4KsNgyDZtwDdGVpN7TPX',
  }

  file { "/home/vagrant/.ssh/id_rsa":
    path => "/home/vagrant/.ssh/id_rsa",
    owner => "vagrant",
    group => "vagrant",
    mode => "0600",
    source => "puppet:///modules/mpi/mpi",
  }

  file { "/home/vagrant/.ssh/id_rsa.pub":
    path => "/home/vagrant/.ssh/id_rsa.pub",
    owner => "vagrant",
    group => "vagrant",
    mode => "0600",
    source => "puppet:///modules/mpi/mpi.pub",
  }

  package { "mpich2": ensure => "installed" }
}
