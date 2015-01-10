file "/srv/www/amocore/current/.htaccess" do
  content "<IfModule mod_rewrite.c>
   RewriteEngine on
   RewriteRule    ^$ app/webroot/    [L]
   RewriteRule    (.*) app/webroot/$1 [L]
</IfModule>"
  action :create
  Chef::Log.info("Sinan Just created .htaccess file for AMO application")
end