require 'itamae'

execute "apt-get update" do
  command "apt-get update"
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

package 'nginx' do
  action :install
end

directory '/usr/share/nginx/' do
  action :create
  owner 'nginx'
  group 'nginx'
end

directory '/usr/share/nginx/html/' do
  action :create
  owner 'nginx'
  group 'nginx'
end

remote_file '/etc/nginx/sites-available/default' do
  owner 'nginx'
  group 'nginx'
  source 'files/default'
end
