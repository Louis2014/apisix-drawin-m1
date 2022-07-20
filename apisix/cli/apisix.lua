--
-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
local pkg_cpath_org = package.cpath
local pkg_path_org = package.path

-- apisix源码路径,本地开发修改为本地项目地址
-- local apisix_home = "/usr/local/apisix"
local apisix_home = "/Users/louis/Documents/idea_workspace/apisix"
local pkg_cpath = apisix_home .. "/deps/lib64/lua/5.1/?.so;"
        .. apisix_home .. "/deps/lib/lua/5.1/?.so;"
local pkg_path = apisix_home .. "/deps/share/lua/5.1/?.lua;"

-- modify the load path to load our dependencies
-- 更改依赖路径，以便加载自己的依赖内容
package.cpath = pkg_cpath .. pkg_cpath_org
package.path = pkg_path .. pkg_path_org

-- pass path to construct the final result
-- env.lua 对运行环境的一些基础操作以及基本变量的获取和修改
--        apisix_home,
--        is_root_path,
--        openresty_args,
--        pkg_cpath_org,
--        pkg_path_org,
--        min_etcd_version,
--        ulimit,
local env = require("apisix.cli.env")(apisix_home, pkg_cpath_org, pkg_path_org)

-- 操作指令的主要逻辑，包括启动、重启、停止、初始化等
local ops = require("apisix.cli.ops")

ops.execute(env, arg)
