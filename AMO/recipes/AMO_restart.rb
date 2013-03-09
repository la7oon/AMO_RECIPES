include_recipe "apache2::service"

service "apache2" do
  Chef::Log.info("Sinan Just Restarted Apache2")
  action :restart
end