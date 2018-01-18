# Haskell Development with Vim in a Vagrant box

I this is essentially an automated version of the environment setup instructions outlined in an [article](http://www.stephendiehl.com/posts/vim_2016.html) written by Stephen Diehl, with only minor tweaks.

## How to use

You will need [Vagrant](https://www.vagrantup.com/) and a compatible version of [VirtualBox](https://www.virtualbox.org/) on your machine. This project was built using Vagrant 2.0.1 with `vagrant-vbguest` plugin (0.15.1) and VirtualBox 5.3.10.

Initialize a new Vagrant environment
```
  vagrant init valfadeev/haskell-vim-proto
```

Your current directory on host will be mapped to `/vagrant` inside the box by default. Optionally edit the generated Vagrantfile to sync a different folder with your existing project sources, for example:
```
  config.vm.synced_folder "./projects", "/home/vagrant/projects"
```

Login to the box with `vagrant ssh`. Create a new project using `stack`, or navigate to an existing one. Happy coding!

## How to build

The machine image is built using [Packer](https://www.packer.io/) (v1.1.4) with [Ansible](https://www.ansible.com/) (2.4.2.0) [provisioner](https://www.packer.io/docs/provisioners/ansible.html). Packer runs [`virtualbox-ovf`](https://www.packer.io/docs/builders/virtualbox-ovf.html) builder which requires an `OVF` file as input. In order to avoid moving files around we rely on the standard location where they are stored by Vagrant when boxes are added using `vagrant add`.

## TODO
 * build an image for [haskell-vim-now](https://github.com/begriffs/haskell-vim-now)
