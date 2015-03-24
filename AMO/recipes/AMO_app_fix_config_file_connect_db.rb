node[:deploy].each do |app_name, deploy|
  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -s https://getcomposer.org/installer | php
    php composer.phar install
    EOH
  end

  template "#{deploy[:deploy_to]}/current/v3.0/app/Config/database.php" do
    source "db-connect.php.erb"
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
     File.directory?("#{deploy[:deploy_to]}/current")
     Chef::Log.info("Sinan COULDN'T creat database.php file for AMO application")
   end
  end
end