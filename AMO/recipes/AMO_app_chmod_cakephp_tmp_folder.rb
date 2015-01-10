execute "chmod_cakephp_tmp_folder" do
  command "sudo chmod -R 777 /srv/www/amocore/current/v3.0/app/tmp"
  action :run
  Chef::Log.info("Sinan Just Changed AMO app tmp access permission into 777 for caching")
end