Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

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


  config.vm.provision "chef_zero" do |chef|
    chef.product = 'chef'

    chef.http_proxy = ENV['http_proxy']
    chef.https_proxy = ENV['https_proxy']
    chef.no_proxy = ENV['no_proxy']

    # Specify the local paths where Chef data is stored
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"

    # Add a recipe
    # chef.add_recipe "apache"

    # Or maybe a role
    chef.add_role "rails"
  end
end
