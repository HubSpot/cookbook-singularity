include_recipe 'apt'

apt_package "nodejs" do
  action :install
end