module("luci.controller.screen_brightness", package.seeall)

function index()
	entry({"admin", "system", "screen_brightness"}, cbi("screen_brightness"), _("屏幕背光控制"), 60)
end