function getSafeWeekGift()
	GetLuaValue("PushEvent('OPEN_SAFECENTER_SAFESCORE')");
	if Show_Window("SafeCenter_SafeScore") then
	GetLuaValue("setmetatable(_G, {__index = SafeCenter_SafeScore_Env});SafeCenter_SafeScore_GetClick()")
	end
end
getSafeWeekGift()
LoadScript("ÏúÂò´æ")