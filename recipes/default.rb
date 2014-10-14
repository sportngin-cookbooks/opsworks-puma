execute "gem uninstall puma" do
  only_if "gem list | grep puma"
end

include_recipe "nginx"

directory "/etc/nginx/shared"
directory "/etc/nginx/http"
directory "/etc/nginx/ssl"

node[:deploy].each do |application, deploy|
  puma_config application do
    directory deploy[:deploy_to]
    environment deploy[:rails_env]
    logrotate deploy[:puma][:logrotate]
    thread_min deploy[:puma][:thread_min]
    thread_max deploy[:puma][:thread_max]
    workers deploy[:puma][:workers]
    worker_timeout deploy[:puma][:worker_timeout]
    restart_timeout deploy[:puma][:restart_timeout] || 120
  end
end

