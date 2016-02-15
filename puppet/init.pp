# Update and upgrade host
# run apt-get update
exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

exec { 'apt-upgrade':
  command => "/usr/bin/apt-get --quiet --yes --fix-broken upgrade",
  logoutput => "on_failure",
  path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin",
  require => Exec['apt-update'],
}

# Install compilers and build tools
$enhancers = [ "build-essential", "gfortran", "sudo"]
package { $enhancers: ensure => "installed" }

# Install PBLAS lib.
$blas_pkg = ["libblas3"]

package { $blas_pkg: ensure => "installed" }

# Install LAPACK. 
$lapack_pkg = ["liblapack3"]
package { $lapack_pkg: ensure => "installed" }

# Install ScaLAPACK.


# Install petsc libraries
$hplibraries = ["libpetsc3.4.2", "libpetsc3.4.2-dbg", "libpetsc3.4.2-dev"]
package { $hplibraries: ensure => "installed" }

include mpi
#include openmp
