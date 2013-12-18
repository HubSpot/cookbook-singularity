bash "starting zookeeper" do
  cwd    "#{node[:mesos][:home]}"
  code   <<-EOH
    mesos/build/3rdparty/zookeeper-3.3.4/bin/zkServer.sh start
  EOH
  action :run
  not_if ("pgrep zoo")
end

bash "starting mesos" do
  cwd    "#{node[:mesos][:home]}"
  code   <<-EOH
    mesos-start-cluster.sh
  EOH
  action :run
  not_if ("pgrep mesos")
end
