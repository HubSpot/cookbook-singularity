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

service "mesos-slave" do
  provider Chef::Provider::Service::Upstart
  action :start
end