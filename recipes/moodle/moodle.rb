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

directory '/usr/share/nginx/html/' do
  action :create
end

git "/usr/share/nginx/html/moodle/" do
  action :sync
  repository "git://git.moodle.org/moodle.git"
  revision "928f14b3cc509b9ad27b3172a8417e2ffe03ce72"
end

group 'nginx' do
  gid 2001
  groupname 'nginx'
end

user 'nginx' do
  uid 2001
  gid 2001
  username 'nginx'
end


