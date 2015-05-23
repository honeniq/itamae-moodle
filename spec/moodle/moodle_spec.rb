require 'spec_helper'

describe "nginx" do
  describe package('nginx') do
    it { should be_installed }
  end
  
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe port(80) do
    it { should be_listening }
  end
end

describe "PHP modules" do
  %w{php5-common php5-curl php5-fpm php5-gd php5-intl php5-json php5-pgsql php5-xmlrpc}.each do | pkg |
    describe package(pkg) do
      it { should be_installed }
    end
  end
end

describe user('nginx') do
  it { should exist }
  it { should belong_to_group 'nginx' }
end

describe file('/usr/share/nginx/html/moodle') do
  it { should be_directory }
end
