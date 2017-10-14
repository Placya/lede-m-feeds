--[[

LuCI mentohust
Author:a1ive

]]--

module("luci.controller.mentohust-sysu-double", package.seeall)

function index()

	if nixio.fs.access("/etc/config/mentohust-sysu-double") then
	local page 
	page = entry({"admin", "services", "mentohust-sysu-double"}, cbi("mentohust-sysu-double"), _("MentoHUST(SYSU Double)"), 30)
	page.i18n = "mentohust-sysu-double"
	page.dependent = true
	end
end
