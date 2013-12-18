app_root_dir = node['zookeeper']['root_dir']
data_dir = node['zookeeper']['data_dir']
config_dir = node['zookeeper']['config_dir']
client_port = node['zookeeper']['client_port']
client_address = node['zookeeper']['client_address']

zoo_cfg = "#{config_dir}/zoo.cfg"

template_variables = {
   :zookeeper_servers           => servers,
   :zookeeper_data_dir          => data_dir,
   :zookeeper_client_port       => client_port,
   :zookeeper_client_address    => client_address
}

template zoo_cfg do
    source "zoo.cfg.erb"
    mode "0644"
    owner "root"
    group "root"
    variables(template_variables)
    not_if do
        File.exists?(zoo_cfg)
    end
end
