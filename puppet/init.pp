$enhancers = [ "build-essential", "gfortran", "sudo"]
package { $enhancers: ensure => "installed" }

include openmp
