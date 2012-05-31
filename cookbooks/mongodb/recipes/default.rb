#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2010, CustomInk, LLC
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


mongods = node.mongodb.mongods

this_mongod = "default"

# Ensure there is only one mongo with ths name
mongods.each do |mongo|
  if mongo["mongod"] == this_mongod
    node.mongodb.mongods.delete(mongo)
  end
end

node.mongodb.mongods.push({ 
  "mongod"          => this_mongod, 
  "port"            => "27017", 
  "replication_set" => "default", 
  "run_backups"     => "false", 
  "rest"            => "false", 
  "monit"           => "false"})

