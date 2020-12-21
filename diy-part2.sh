#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.50/g' package/base-files/files/bin/config_generate
#
#readd cpufreq for aarch64
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
#
#运行 ./scripts/feeds install -a 时候报错形如“WARNING: Makefile 'package/lean/amule/Makefile' has a dependency on 'libpng', which does not exist”
#重新./scripts/feeds install -a
#./scripts/feeds clean
#添加luci_theme_argon主题
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#./scripts/feeds update -a
#./scripts/feeds install -a
#
#删除Lean/packages/lean下的luci-theme-argon
rm -rf package/lean/luci-theme-argon/
#添加luci_theme_argon主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
#添加luci-app-vssr（helloworld修改版）
#cd ./package/lean
#git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
#主程序
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/lua-maxminddb/luci-app-vssr
#
#./scripts/feeds update infinityfreedom
#./scripts/feeds install luci-theme-infinityfreedom
#返回上两级目录(openwrt,lean目录)
#cd ../..
#关机
#cd ./package/lean 
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/lua-maxminddb/luci-app-poweroff
#
#自动关机
#cd ./package/lean
git clone https://github.com/sirpdboy/luci-app-autopoweroff.git package/lean/lua-maxminddb/luci-app-autopoweroff
#
#常用软件包
#cd ./package/lean
#git clone https://github.com/liuran001/openwrt-packages package
git pull && ./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds install -a
