directory "/srv/www/amo/current/app/tmp" do
  mode 0777
  action :update
  Chef::Log.info("Sinan Just Restarted Apache2")
end