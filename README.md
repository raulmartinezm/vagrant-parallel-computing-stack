## About

Creates a parallel development enviroment provided with the basic tools to program and test a parallel C application.  
It provides from one to a cluster of N virtualbox machines provisioned with:


- GNU C compiler (gcc).
- GNU Fortran Compiler (gfortran).
- OpenMP library.
- MPI library (mpich).

- ScaLAPACK.
- LAPACK.
- PBLAS.
- PETSc.

## Requirements

- Vagrant
- VirtualBox

You'll need a Debian Vagrant base box added to your vagrant install with the name 'wheezy'. e.g:

    $ vagrant box list
    wheezy
    ubuntu
    centos
    ...

You can get pre-built Vagrant boxes from the internet or build your own with [veewee](https://github.com/jedi4ever/veewee/).

## Usage in Linux

Clone the repository in a directory in localhost. 

    $ cd ~
    $ git clone http://whatever

Configure the number of nodes editing the VagrantFile.

    ...
    # Number of hosts and CPU(s) per host.
    num_nodes = 2
    num_cpu_host = 2
    ...

Enter the directory and execute:

    $ vagrant up --provision

Enter the main node:

    $ vagrant ssh master

When execute a MPI program add the parameter **--mca btl_tcp_if_include "eth1"** to restrign vagrant's network interface. e.g:

    $ mpiexec --mca btl_tcp_if_include "eth1" -np 4  -machinefile machinefile /vagrant/myprogram


## Usage in MacOS
TODO

## Usage in Windows
TODO
