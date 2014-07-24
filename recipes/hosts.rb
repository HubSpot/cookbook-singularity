include_recipe 'hostsfile'

hostfile_entry '127.0.1.1' do
  action :remove
end

hostfile_entry node[:mesos][:common][:ip] do
  hostname node['hostname']
  action :update
end