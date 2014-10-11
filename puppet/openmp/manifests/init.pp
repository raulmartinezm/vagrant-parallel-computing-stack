class openmp {

  $packages = ["libgomp1", "libgomp1-dbg"]
  package { $packages:
      ensure => "installed"
  }
}
