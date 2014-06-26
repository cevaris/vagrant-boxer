# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$puppet_client = %Q{
# wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
# sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update
sudo apt-get install puppet -y
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.synced_folder 'hieradata/', '/var/lib/hieradata'

  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.box = 'precise64'

  config.vm.define 'ws00' do |node|
    node.vm.hostname = 'ws00.tesla.prod'

    node.vm.provision 'shell', inline: $puppet_client

    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests/"
      puppet.manifest_file = "ws00.tesla.prod.pp"
      puppet.module_path = "modules/"
      puppet.options = "--verbose --debug"

      puppet.hiera_config_path = "hiera.yaml"
    end

  end


end
