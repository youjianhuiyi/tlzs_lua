--[[
	脚本作用：将角色身上的元宝兑换成元宝票，自动存银行
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


---------------------------------------------------------------------
-- 执行帮会聚宝盆的角色
---------------------------------------------------------------------
function goToCornucopia()
	local playName = GetPlayerInfo("NAME");
    LoadScript("allPlayers.lua");

	for key,value in ipairs(cornucopiaPlayers) do
		PushDebugMessage("#eDC4C18#cFFFF00 "..playName.."-- 需要去聚宝盆，令牌还没满");
		if playName == value then
			PushDebugMessage("#eDC4C18#cFFFF00 "..value .. "准备去帮会聚宝盆");
			LoadScript("帮会聚宝盆")
		end
	end

end


---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
goToCornucopia();