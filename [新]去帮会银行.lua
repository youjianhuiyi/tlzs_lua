local MapName = GetActiveSceneName()
local LocationItems = {"白色定位符","蓝色定位符","红色定位符","黄色定位符","紫色定位符","绿色定位符"}
--判断角色当前所在地图，就近领取任务
取消跟随()
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
					跨图寻路("苏州",340,210)
				end
			end
		end
	end
	
	MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
end

QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
输入屏幕文本("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")

--核心调用，
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "钱为一" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
			QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
			return true
		end
	end
end

if CityToGuild() then
   checkNPCDst()
end