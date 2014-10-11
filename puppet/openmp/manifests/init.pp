class openmp {

  $packages = ["build-essential", "libgomp1", "libgomp1-dbg"]
  package { $packages:
      ensure => "installed"
  }
}
