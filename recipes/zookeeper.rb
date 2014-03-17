include_recipe 'apt'

apt_package "zookeeperd" do
  action :install
end
