Vagrant.require_version '>= 1.5.0'

Vagrant.configure('2') do |config|
  config.vm.box = 'cirex/ubuntu-13.10'
  config.vm.box_version = '>= 1.0.0'
  config.vm.synced_folder '.', '/home/cirex'
  config.vm.synced_folder '../projects', '/home/cirex/projects'
  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.manifest_file = 'default.pp'
    puppet.modules_path = 'puppet/modules'
  end
end