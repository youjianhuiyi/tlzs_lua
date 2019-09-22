-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
local flag = true

function goGuild()
	if MapName == "洛阳" or MapName == "苏州" or MapName == "大理" or MapName == "楼兰" then
		跨图寻路("洛阳",347,249)
		flag = false
	else
		取消跟随()
		下坐骑()
		local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
		if bUse then
			跨图寻路("洛阳",347,249)
		end
		flag = false
	end
end

取消跟随()
while flag do
 goGuild()
end
执行脚本("[功能] 买卖补给");Sleep(2000)
执行脚本("[功能] 物品存仓");Sleep(1000)
执行脚本("加工材料")