--[[

LuCI mentohust
Author:a1ive

]]--

module("luci.controller.mentohust-sysu-triple", package.seeall)

function index()

	if nixio.fs.access("/etc/config/mentohust-sysu-triple") then
	local page 
	page = entry({"admin", "services", "mentohust-sysu-triple"}, cbi("mentohust-sysu-triple"), _("MentoHUST(SYSU Triple)"), 30)
	page.i18n = "mentohust-sysu-triple"
	page.dependent = true
	end
end
