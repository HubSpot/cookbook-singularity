docker_enabled = node[:docker][:enabled]
docker_package_version = node[:docker][:package_version]

directory '/etc/mesos-slave' do
  owner 'root'
  group 'root'
  action :create
end

node[:mesos][:slave].each do |key, value|
  file "/etc/mesos-slave/#{key}" do
    owner 'root'
    group 'root'
    mode '0644'
    action :create
    content value
  end
end

if docker_enabled
  apt_package "docker.io" do
    action :install
    version docker_package_version
  end

  file "/etc/mesos-slave/containerizers" do
    owner 'root'
    group 'root'
    mode '0644'
    action :create
    content "docker,mesos"
  end
end

service "mesos-slave" do
  provider Chef::Provider::Service::Upstart
  action :start
end