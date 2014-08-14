private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first

node.set['java']['install_flavor'] = "oracle"
node.set['java']['jdk_version'] = "7"
node.set['java']['oracle']['accept_oracle_download_terms'] = true
node.set['java']['set_default'] = true

default[:singularity] = {
  :database => {
    :db_name => "singularity",
    :username => "singularity",
    :password => "9thlevel"
  },
}

default[:mesos] = {
  :package_version => "0.19.1-1.0.ubuntu1404",
  :common => {
    :ip => private_ip,
  },
  :master => {
    :cluster => 'vagrant-singularity',
  },
  :slave => {}
}
