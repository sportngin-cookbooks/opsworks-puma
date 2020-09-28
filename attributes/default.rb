default.puma[:version] = "2.8.2"

default[:nginx][:prefix_dir] = "/usr/share/nginx"

default[:nginx][:ssl_dir] = "#{node[:nginx][:dir]}/ssl"
default[:nginx][:dh_key] = "#{node[:nginx][:ssl_dir]}/dhparam.pem"
default[:nginx][:dh_key_bits] = 4096
