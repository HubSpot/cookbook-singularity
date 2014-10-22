private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first

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

default[:docker] = {
  :enabled => false,
  :package_version => "1.0.1~dfsg1-0ubuntu1~ubuntu0.14.04.1",
}

override['java']['install_flavor'] = "oracle"
override['java']['jdk_version'] = "7"
override['java']['oracle']['accept_oracle_download_terms'] = true
override['java']['set_default'] = true
