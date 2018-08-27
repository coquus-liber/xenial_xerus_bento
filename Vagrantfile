# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_root = File.dirname(__FILE__)

def home
  @home ||= ENV.fetch("HOME").tr("\\", "/")
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = ENV['http_proxy']
    config.proxy.https    = ENV['https_proxy']
    config.proxy.ftp      = ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.name = "xenial"
    vb.memory = 1024 * 4
    vb.cpus = 2
    # v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']

    # Add a virtual cd drive (for guest additions, etc)
    vb.customize ['storageattach', :id,
      "--storagectl", "IDE Controller",
      '--port', 1,
      '--device', 0,
      '--type', 'dvddrive',
      '--medium', 'emptydrive'] # 'additions' ?
  end
  
  ## Copy generated ssh id_rsa certs
  config.vm.provision :file, source: "#{home}/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa", run: "always"
  config.vm.provision :file, source: "#{home}/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub", run: "always"
  config.vm.provision 'shell', privileged: false, inline: "chmod go-rwx .ssh/id_*", run: "always"

  config.vm.provision :file, source: "#{home}/.gitconfig", destination: "/home/vagrant/.gitconfig", run: "always"

  config.vm.provision 'shell', privileged: true, path: "#{vagrant_root}/chef/install.sh"
  config.vm.provision :file, source: "#{vagrant_root}/chef", destination: "/tmp/chef"
  config.vm.provision 'shell', privileged: true, path: "#{vagrant_root}/chef/configure.sh"

end
