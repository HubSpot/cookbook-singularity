include_recipe 'apt'

apt_package "maven" do
  action :install
end