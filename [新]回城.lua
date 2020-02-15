-----开始----------------------
local MapName = GetActiveSceneName()
local LocationItems = {"白色定位符","蓝色定位符","红色定位符","黄色定位符","紫色定位符","绿色定位符"}
--判断角色当前所在地图，就近领取任务
local Jiaozi = GetMoney(2)

function backCity()
	if MapName == "洛阳" or MapName == "苏州" or MapName == "大理" or MapName == "楼兰" then
		跨图寻路("苏州",340,210)
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
					--使用道具栏物品
					--	返回值：2个(逻辑型 整数型) 是否使用 位置索引
					--  参数1：文本型		物品名称，支持多个物品，空格隔开
					--  参数2：整数型		0无所谓 1不绑的 2绑定的
					local bUse, nIndex = Bag:UseBagItem_DJ(tmp.name, 0)
					Sleep(1000)
					if bUse then
						return true
					end
				end
			end			
		end
		local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
		if bUse then
			跨图寻路("苏州",340,210)
		end
	end
end

-- 检测背包里面没有交子的时候，取金币进行买卖宝宝粮
function CoinToJiaozi()
	--仓库取钱，参数2可空
	Bank_GetMoney(50000)
end

-- 核心调用
backCity()

if Jiaozi / 10000 <= 2 then
	CoinToJiaozi()
end
执行脚本("[功能] 买卖补给");Sleep(2000)
执行脚本("[功能] 物品存仓");Sleep(1000)
执行脚本("加工材料")