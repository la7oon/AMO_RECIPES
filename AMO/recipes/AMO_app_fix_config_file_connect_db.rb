node[:deploy].each do |app_name, deploy|

  template "/srv/www/amocore/current/v3.0/app/Config/database.php" do
    source "database.php.erb"
    mode 0660
    group deploy[:group]

    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    end

    variables(
      :host =>     (deploy[:database][:host] rescue nil),
      :user =>     (deploy[:database][:username] rescue nil),
      :password => (deploy[:database][:password] rescue nil),
      :db =>       (deploy[:database][:database] rescue nil)
    )
    
    Chef::Log.info("Sinan Just created database.php file for AMO application")
   
   only_if do
     File.directory?("/srv/www/amocore/current")
   end
  end
end
