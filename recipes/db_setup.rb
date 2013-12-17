include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database "singularity" do
  connection mysql_connection_info
  action :create
end
