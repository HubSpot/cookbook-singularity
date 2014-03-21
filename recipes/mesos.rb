private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first

directory '/etc/mesos-master' do
  owner 'root'
  group 'root'
  action :create
end

file '/etc/mesos-master/ip' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  content private_ip
end

include_recipe "mesos::master"
include_recipe "mesos::slave"