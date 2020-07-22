--[[
    脚本功能：检测背包是否有定位符
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local LocationItems = {"白色定位符","蓝色定位符","红色定位符","黄色定位符","紫色定位符","绿色定位符"}
-- local flag = true


---------------------------------------------------------------------
-- 检测定位符
---------------------------------------------------------------------
function judgeLocationItems()
	for key,value in ipairs(LocationItems) do
		--遍历道具栏材料栏所有物品
		--返回值：物品数组
		local tObj = Bag:EnumAllObj()
		for i = 1, #tObj do
			local tmp = tObj[i]
			if tmp.name == value and tmp.count >= 1 then 
				return true
			end
		end
	end
	LoadScript("[09] 扫街喊话收购")
end

-- 核心调用
judgeLocationItems()
