app_root_dir = node[:singularity][:zookeeper][:root_dir]
data_dir = node[:singularity][:zookeeper][:data_dir]
config_dir = node[:singularity][:zookeeper][:config_dir]
client_port = node[:singularity][:zookeeper][:client_port]
client_address = node[:singularity][:zookeeper][:client_address]

zoo_cfg = "#{config_dir}/zoo.cfg"

template_variables = {
   :zookeeper_data_dir          => data_dir,
   :zookeeper_client_port       => client_port,
   :zookeeper_client_address    => client_address
}

directory data_dir do
   mode "0755"
   action :create
end

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
