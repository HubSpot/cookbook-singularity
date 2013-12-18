bash "starting zookeeper" do
  code   <<-EOH
    /home/vagrant/mesos/build/3rdparty/zookeeper-3.3.4/bin/zkServer.sh stop || true
    /home/vagrant/mesos/build/3rdparty/zookeeper-3.3.4/bin/zkServer.sh start
  EOH
  action :run
end

bash "starting mesos" do
  code   <<-EOH
    sleep 5
    mesos-stop-cluster.sh || true
    mesos-start-cluster.sh 
  EOH
  action :run
end
