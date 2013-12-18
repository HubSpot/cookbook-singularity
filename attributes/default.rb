default[:singularity] = {
  :database => {
    :db_name => "singularity",
    :username => "singularity",
    :password => "9thlevel"
  },
  :zookeeper => {
    :root_dir => '/home/vagrant/mesos/build/3rdparty/zookeeper-3.3.4',
    :config_dir => '/home/vagrant/mesos/build/3rdparty/zookeeper-3.3.4/conf',
    :data_dir => '/usr/local/zookeeper',
    :client_port => '2181',
    :client_address => '0.0.0.0' 
  }
}
