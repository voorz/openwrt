local m, s, o

m = Map("screen_brightness", translate("屏幕背光控制"),
	translate("For 西瓜皮V3 Only"))

s = m:section(TypedSection, "screen_brightness", "")
s.anonymous = true
s.addremove = false

o = s:option(Flag, "enabled", translate("启用"))
o.rmempty = false
o.default = "0"
o.description = translate("开机时自动设置屏幕亮度")

o = s:option(Value, "brightness", translate("亮度"))
o.datatype = "range(0,255)"
o.default = "128"
o.rmempty = false
o.description = translate("屏幕亮度值，范围 0-255，0 为最暗，255 为最亮")

o = s:option(DummyValue, "_info", translate("定时"))
o.rawhtml = true
o.value = [[
<div style="padding: 0px; margin-top: 12px; margin-bottom: 0.875rem;">
	<ul style="line-height: 1.2;">
		<li style="margin-bottom: 8px;">系统 -> 计划任务</li>
		<li style="margin-bottom: 8px;">添加一行:</li>
		<li style="margin-bottom: 8px;"><code>[分] [时] [日] [月] [周] /bin/set-xgp-screen-brightness [亮度值]</code></li>
		<li style="margin-bottom: 8px;">例如每晚21点设置亮度为一半亮度:</li>
		<li style="margin-bottom: 8px;"><code>0 21 * * * /bin/set-xgp-screen-brightness 128</code></li>
		<li>时间的写法请参考 Linux crontab 格式，可在 <a href="https://crontab.guru/" target="_blank">crontab.guru</a> 测试</li>
	</ul>
</div>
]]

-- 保存后执行命令
function m.on_after_commit(self)
	local enabled = m.uci:get("screen_brightness", "config", "enabled")
	local brightness = m.uci:get("screen_brightness", "config", "brightness")
	
	if enabled == "1" then
		luci.sys.call("/bin/set-xgp-screen-brightness " .. brightness)
	end
	
	-- 启用或禁用开机自启
	if enabled == "1" then
		luci.sys.call("/etc/init.d/screen_brightness enable")
	else
		luci.sys.call("/etc/init.d/screen_brightness disable")
	end
end

return m