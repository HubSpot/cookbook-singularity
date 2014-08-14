apt_package "nodejs" do
  action :install
end

bash "sympolic link to node" do
  user "root"
  code <<-EOH
     ln -s /usr/bin/nodejs /usr/bin/node
  EOH
end