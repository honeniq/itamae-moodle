require "itamae"

package 'git' do
  action :install
end

%w{nginx}.each do |pkg|
  package pkg do
    action :install
  end
end


%w{php5-common php5-curl php5-fpm php5-gd php5-intl php5-json php5-pgsql php5-xmlrpc}.each do |pkg|
  package pkg do
    action :install
  end
end


git "/usr/share/nginx/html/moodle/" do
  action :sync
  repository "git://git.moodle.org/moodle.git"
  revision "928f14b3cc509b9ad27b3172a8417e2ffe03ce72"
end



