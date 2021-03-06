#
# Cookbook Name:: postgresql
# Recipe:: client
#
# Author:: Romain Champourlier (<romain@softr.li>)
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Lamont Granquist (<lamont@opscode.com>)
# Copyright 2009-2011 Opscode, Inc.
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

pg_packages = case node['platform']
when "ubuntu","debian"
  if node[:postgresql][:version].to_f < 9
    ['postgresql-client']
  else # should work for 9.1 and 9.2
    ["postgresql-client-#{node[:postgresql][:version]}"]
  end
end

pg_packages.each do |pg_pack|
  package pg_pack do
    action :install
  end
end