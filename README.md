## About

Creates a parallel development enviroment provided with the tools necesary for a basic course in Parellel Computing. 
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

Enter the directory and execute:

    $ vagrant up --provision

Enter the main node:

    $ vagrant ssh

Once logged into the node, you can find MPI and OpenMP code **examples** in */home/vagrant/examples*

## Usage in MacOS


## Usage in Windows


## Notes 
