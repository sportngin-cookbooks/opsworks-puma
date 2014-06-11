ruby_block "ensure only our puma version is installed by deinstalling any other version" do
  block do
    ensure_only_gem_version('puma', node[:puma][:version])
  end
end

include_recipe "nginx"


node[:deploy].each do |application, deploy|
  puma_config application do
    directory deploy[:deploy_to]
    environment deploy[:rails_env]
    logrotate deploy[:puma][:logrotate]
    thread_min deploy[:puma][:thread_min]
    thread_max deploy[:puma][:thread_max]
    workers deploy[:puma][:workers]
    worker_timeout deploy[:puma][:worker_timeout]
  end
end

