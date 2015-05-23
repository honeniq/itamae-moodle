# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Moodle VM
  config.vm.define :moodle do | moodle |
    moodle.vm.network "forwarded_port", guest: 80, host: 8080
    moodle.vm.provision :itamae do | itamae |
      itamae.sudo = true
      itamae.recipes = ['./recipes/moodle/moodle.rb']
    end
  end
end
