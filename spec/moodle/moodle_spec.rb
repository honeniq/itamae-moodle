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

  describe service('php5-fpm') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/var/run/php5-fpm.sock') do
    it { should exist }
  end
end

describe user('nginx') do
  it { should exist }
  it { should belong_to_group 'nginx' }
end

describe file('/usr/share/nginx/html/moodle') do
  it { should be_directory }
  it { should be_owned_by 'nginx' }
  it { should be_grouped_into 'nginx' }
  it { should be_readable.by_user('nginx') }
  it { should be_writable.by_user('nginx') }
  it { should be_executable.by_user('nginx') }
end
