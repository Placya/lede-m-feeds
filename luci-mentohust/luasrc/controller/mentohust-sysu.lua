--[[

LuCI mentohust
Author:a1ive

]]--

module("luci.controller.mentohust-sysu", package.seeall)

function index()

	if nixio.fs.access("/etc/config/mentohust-sysu") then
	local page 
	page = entry({"admin", "services", "mentohust-sysu"}, cbi("mentohust-sysu"), _("MentoHUST(SYSU)"), 30)
	page.i18n = "mentohust-sysu"
	page.dependent = true
	end
end
