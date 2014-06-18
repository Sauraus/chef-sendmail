
Vagrant.configure("2") do |config|
  config.vm.hostname = "chef-sendmail-berkshelf"

  config.vm.box = "opscode-centos-6.5-provisionerless"

  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  config.omnibus.chef_version = :latest

  config.vm.network :private_network, ip: "33.33.33.01"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
        'sendmail' => {
            'relay_host' => 'mail.example.com',
            'mydomain' => 'example.com'
        }
    }

    chef.run_list = [
        "recipe[sendmail]"
    ]
  end
end
