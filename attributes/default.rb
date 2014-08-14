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
