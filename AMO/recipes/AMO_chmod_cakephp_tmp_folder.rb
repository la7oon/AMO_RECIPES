execute "chmod_cakephp_tmp_folder" do
  command "sudo chmod -R 777 /srv/www/amo/current/app/tmp"
  action :run
  Chef::Log.info("Sinan Just Restarted Apache2")
end