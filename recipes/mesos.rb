private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first

["/etc/mesos-master", "/etc/mesos-slave"].each do |dir|
  directory dir do
    owner "root"
    group "root"
    mode 00755
    action :create
  end

  file "#{dir}/ip" do
    owner "root"
    group "root"
    mode 00644
    action :create
    content "#{private_ip}"
  end
end

include_recipe "mesos::master"
include_recipe "mesos::slave"
