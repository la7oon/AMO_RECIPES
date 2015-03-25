node[:deploy].each do |app_name, deploy|

  template "#{deploy[:deploy_to]}/current/v3.0/app/Config/database.php" do
    source "database.php.erb"
    mode 0660
    group deploy[:group]

    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
    owner "apache"
    end



  end
end