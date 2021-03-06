#
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php
# Recipe:: package
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

pkgs = value_for_platform(
  [ "centos", "redhat", "fedora" ] => {
    "default" => %w{ php53 php53-devel php53-cli php-pear }
  },
  [ "debian", "ubuntu" ] => {
    "default" => %w{ php5-cgi php5 php5-dev php5-cli php-pear }
  },
  "default" => %w{ php5-cgi php5 php5-dev php5-cli php-pear }
)

if node[:php][:ppa]
  execute 'apt-get update -y' do
    user 'root'
  end

  %w{
    python-software-properties
    software-properties-common
    }.each do |pkg|
    package pkg do
      action :install
    end
  end
  
  execute "add-apt-repository #{node[:php][:ppa][:uri]}" do
    user "root"
  end

  execute 'apt-get update -y' do
    user 'root'
  end
end

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

directory node['php']['conf_dir'] do
  owner 'root'
  group 'root'
  recursive true
end

template "#{node['php']['conf_dir']}/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end