require "itamae"


package 'git' do
  action :install
end

git "/usr/share/nginx/html/moodle/" do
  action :sync
  repository "git://git.moodle.org/moodle.git"
  revision "928f14b3cc509b9ad27b3172a8417e2ffe03ce72"
  user 'nginx'
end


