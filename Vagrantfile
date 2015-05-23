# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision :itamae do |config|
    # execute command with sudo privilege(true or false)
    config.sudo = true

    # recipes(String or Array)
    config.recipes = ['./recipe/moodle/moodle.rb']

    #config.json = './node.json'
  end
end
