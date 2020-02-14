-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
local flag = true
local Jiaozi = GetMoney(2)

function backCity()
	if MapName == "洛阳" or MapName == "苏州" or MapName == "大理" or MapName == "楼兰" then
		跨图寻路("苏州",340,210)
		flag = false
	else
		取消跟随()
		--下坐骑
		Dismount()
		--查找道具栏物品
		--	返回值：2个(逻辑型 整数型) 是否找到 位置索引
		--  参数1：文本型 		物品名称，只支持精确名字
		--  参数2：整数型 		绑定状态 0无所谓 1不绑的 2绑定的
		local bFind, nIndex = Bag:FindBagItem_DJ("紫色定位符", 0)
		if bFind then
			while true do
				--使用道具栏物品
				--	返回值：2个(逻辑型 整数型) 是否使用 位置索引
				--  参数1：文本型		物品名称，支持多个物品，空格隔开
				--  参数2：整数型		0无所谓 1不绑的 2绑定的
				local bUse, nIndex = Bag:UseBagItem_DJ("紫色定位符", 0)
				Sleep(1000)
				if bUse then 
					return true
				end
			end
		else 
			local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
			if bUse then
				跨图寻路("苏州",340,210)
			end
			flag = false
		end
	end
end

-- 检测背包里面没有交子的时候，取金币进行买卖宝宝粮
function CoinToJiaozi()
	--仓库取钱，参数2可空
	Bank_GetMoney(50000)
	-- if MapName == "洛阳" then
		-- MoveToNPC(347,248,0,"卫先生");Sleep(50)
	-- elseif MapName == "苏州" then
		-- MoveToNPC(343,246,1,"梁伙计");Sleep(50)
	-- elseif MapName == "大理" then 
		-- MoveToNPC(213,179,2,"霍伙计");Sleep(50)
	-- elseif MapName == "楼兰" then
		-- MoveToNPC(219,122,246,"庞伙计");Sleep(50)
	-- else 
		-- MoveToNPC(343,246,1,"梁伙计");Sleep(50)
	end
end

-- 核心调用
while flag do
 backCity()
end
if Jiaozi / 10000 <= 2 then
	CoinToJiaozi()
end
执行脚本("[功能] 买卖补给");Sleep(2000)
执行脚本("[功能] 物品存仓");Sleep(1000)
执行脚本("加工材料")