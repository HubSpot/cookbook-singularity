private_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first

include_recipe "mesos::master"
include_recipe "mesos::slave"

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/default/mesos")
    file.insert_line_if_no_match("/MESOS_ip=/", "MESOS_ip=#{private_ip}")
    file.write_file
  end
end