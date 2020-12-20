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
#运行 ./scripts/feeds install -a 时候报错形如“WARNING: Makefile 'package/lean/amule/Makefile' has a dependency on 'libpng', which does not exist”
#重新./scripts/feeds install -a
#./scripts/feeds clean
#添加luci_theme_argon主题
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#./scripts/feeds update -a
./scripts/feeds install -a
#
#删除Lean/packages/lean下的luci-theme-argon
#cd ./package/lean 
#rm -rf ./package/lean/luci-theme-argon
#添加luci_theme_argon主题
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#./scripts/feeds update infinityfreedom
#./scripts/feeds install luci-theme-infinityfreedom
#返回上两级目录(openwrt,lean目录)
#cd ../..
#readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
