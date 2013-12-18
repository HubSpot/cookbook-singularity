include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node[:singularity][:database][:db_name] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node[:singularity][:database][:username] do
  connection mysql_connection_info
  password node[:singularity][:database][:password]
  database_name node[:singularity][:database][:db_name]
  host '%'
  privileges [:all]
  action [:create, :grant]
end
