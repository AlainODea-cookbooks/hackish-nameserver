#
# Cookbook Name:: hackish-nameserver
# Recipe:: default
#
# Copyright 2013, Alain O'Dea
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
package "bind-9.9"

template "/opt/local/etc/named.conf" do
  source "named.conf.erb"
  user "root"
  group "root"
  mode 0644
  notifies :restart, "service[nameserver]"
end

%w{alainodea.local 192.168.2 127.0.0}.each do |zone|
  template "/var/named/db.#{zone}" do
    source "db.#{zone}.erb"
    owner "root"
    group "root"
    mode 00644
    notifies :restart, "service[nameserver]"
  end
end

remote_file "/var/named/db.cache" do
  owner "root"
  group "root"
  mode 00644
  source "ftp://ftp.internic.net/domain/named.cache"
  notifies :restart, "service[nameserver]"
end

service "nameserver" do
  service_name "dns/server"
  supports :restart => true, :reload => false, :status => true
  action [:enable, :start]
end
