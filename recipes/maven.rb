include_recipe 'apt'
include_recipe 'java'

apt_package "maven" do
  action :install
end