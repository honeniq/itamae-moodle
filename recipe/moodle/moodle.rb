require "itamae"


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
