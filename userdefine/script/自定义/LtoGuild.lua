--[[
	脚本作用：通用进帮派方法，提取出来
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


local MapName = GetActiveSceneName()
local flag = true

---------------------------------------------------------------------
-- 去钱庄兑换元宝票
---------------------------------------------------------------------
function goGuildNPC()
	if MapName == "洛阳" then
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	elseif MapName == "苏州" then
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
		flag = false
	elseif MapName == "大理" then
		MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
		flag = false
	elseif MapName == "楼兰" then
		MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
		flag = false
	else
		Player_TeamFollow(false)
		Dismount()
		local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
		if bUse == false then
			跨图寻路("洛阳",347,249)
		end
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	end
end

goGuildNPC();