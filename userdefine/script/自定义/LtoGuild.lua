--[[
	脚本作用：通用进帮派方法，提取出来
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


local MapName = GetActiveSceneName()
local LocationItems = {"白色定位符","蓝色定位符","红色定位符","黄色定位符","紫色定位符","绿色定位符"}

---------------------------------------------------------------------
-- 去帮派
---------------------------------------------------------------------
function goGuildNPC()
	--判断角色当前所在地图，就近领取任务
	Player_TeamFollow(false)
	if MapName == "洛阳" then
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
	elseif MapName == "苏州" then
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
	elseif MapName == "大理" then
		MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
	elseif MapName == "楼兰" then
		MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
	else
		--下坐骑
		Dismount()
		for key,value in ipairs(LocationItems) do
			--遍历道具栏材料栏所有物品
			--返回值：物品数组
			local tObj = Bag:EnumAllObj()
			for i = 1, #tObj do
				local tmp = tObj[i]
				if tmp.name == value and tmp.count >= 1 then 
					local nIndex = tmp.index
					local locationName = tmp.name
					--使用道具栏物品
					--	返回值：2个(逻辑型 整数型) 是否使用 位置索引
					--  参数1：文本型		物品名称，支持多个物品，空格隔开
					--  参数2：整数型		0无所谓 1不绑的 2绑定的
					local bUse, nIndex = Bag:UseBagItem_DJ(tmp.name, 0)
					Sleep(1000)
					if bUse then 
						break
					end
				else 
					local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
					if bUse then
						MoveToNPC(340,210,1,"苏州")
					end
				end
			end
		end
		
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
	end

end