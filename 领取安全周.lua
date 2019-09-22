function 领取安全周奖励()
	GetLuaValue("PushEvent('OPEN_SAFECENTER_SAFESCORE')");
	if Show_Window("SafeCenter_SafeScore") then
	GetLuaValue("setmetatable(_G, {__index = SafeCenter_SafeScore_Env});SafeCenter_SafeScore_GetClick()")
	end
end
领取安全周奖励()
执行脚本("销买存")