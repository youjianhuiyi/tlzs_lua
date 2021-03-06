--[[
    脚本功能：加强版回城,先退队跟随，再想一切办法最快回城，回城后执行买卖补给，加工材料，如果没交子就取钱买肉
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


local MapName = GetActiveSceneName()
local LocationItems = {"白色定位符","蓝色定位符","红色定位符","黄色定位符","紫色定位符","绿色定位符"}
--判断角色当前所在地图，就近领取任务
local Jiaozi = GetMoney(2)


-----------------------------------------------------------
-- 自动回城
-----------------------------------------------------------
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
					Sleep(10000)
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


-----------------------------------------------------------
-- 检测背包里面没有交子的时候，取金币进行买卖宝宝粮
-----------------------------------------------------------
function CoinToJiaozi()
	--仓库取钱，参数2可空
	Bank_GetMoney(50000)
end


-----------------------------------------------------------
-- 核心调用
-----------------------------------------------------------
Player_TeamFollow(false) --取消组队跟随
backCity()

--获取背包物品数量
--	返回值：整数型
--  参数1：文本型		物品名称，只支持精确名字
--  参数2：整数型		绑定状态 0无所谓 1不绑的 2绑定的
--  参数3：整数型		锁定状态 0无所谓 1不锁的 2锁定的
local nCount = Bag:GetItemCount("后肘肉口粮", 0, 1)

if nCount <= 60 then
	if Jiaozi / 10000 <= 2 then
		CoinToJiaozi()
	end
	LoadScript("[功能] 买卖补给");Sleep(2000)
end
LoadScript("[功能] 物品存仓");Sleep(1000)
LoadScript("加工材料")