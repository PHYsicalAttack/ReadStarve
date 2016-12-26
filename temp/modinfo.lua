-- modinfo.lua				Desc:sweethoneytea modinfo
name = "ASweet Honey Tea Time"
author = "ymzx"
version = "0.1"
description = [[
It's Sweet Honey Tea Time,K-ON!!
This mod is inspired by animation K-ON,contains changes with honeycomb,bee,beehat,beebox]]
--your can
forumthread = "github.com"
api_version = 6
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true 				--fuck klei if this false,mod will not work
priority = -1

icon_atlas = "images/myatlas.xml"
icon = "images/myprefab.tex"
----------------
configuration_options = {
	{
		name = "option1",
		label = "option1",
		options = {
			{description = "option1true",data = true},
			{description = "option1false",data = false},
		},
		default = true,
	},
}


--[[
1.蜂巢可以合成和出售给猪王
2.蜜蜂不会攻击(i.e 特定角色 或特定情况 蜜蜂不会攻击)
3.收获蜂蜜的时候额外获得蜂刺
4.杀人蜂会保护助教
5.蜜蜂茶
6.收获农作物几率获得茶叶，另外干枯的农作物——>茶叶?
7.foods
]]
