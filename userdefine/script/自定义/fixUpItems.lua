--[[
	脚本作用：通用方法，检测背包物品，用于整理交易以及交易等使用
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
-----------------------------------------------------------
-- 判断背包里面的脚本
-----------------------------------------------------------
function judgeBagIsEmpty()
    local tObj = Bag:EnumAllObj()
	local n = 0
	local m = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1
		end
	end
	return {bag1 = n,bag2 = m}
end

judgeBagIsEmpty();