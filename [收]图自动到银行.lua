-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
local flag = true
local n = 0
local m = 0
local players = {
	--第一队 追逐ゝ
	{name = "追逐ゝ",num1 = 30,num2 = 25},
	{name = "多情的小男人",num1 = 26,num2 = 26},
	{name = "Eternally°L",num1 = 26,num2 = 26},
	{name = "Eternally｀L",num1 = 30,num2 = 30},
	{name = "Eternally＇L",num1 = 26,num2 = 26},
	{name = "大雪紛飛丶",num1 = 25,num2 = 25},
	--第二队
	{name = "獨自一人丶",num1 = 25,num2 = 25},
}

-- 仓库取图逻辑
function getTu(num)
	local strItem = AI_GetParameter_User("取图挖图")
	strItem = " " .. strItem .. " " 
	PushDebugMessage("取出物品：" .. strItem)
	Bank_GetItem(strItem, num)
end

-- 仓库取图到帮会NPC处
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
		取消跟随()
		下坐骑()
		local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
		if bUse == false then
			跨图寻路("洛阳",347,249)
		end
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	end
end

-- 从帮会NPC进入帮会打开对话
function toGuild()
	while flag do
	 goGuildNPC()
	 Sleep(100)
	end
	PushDebugMessage("直接去本帮城市了")
	QuestFrameOptionClicked("进入本帮城市");Sleep(1000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "钱为一"); Sleep(1000)
		QuestFrameOptionClicked("帮会银行",1); Sleep(1000)
	end
end

-- 检查NPC离自己的距离
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "钱为一" and tonumber(tmp.dst) <= 3 then
			return true
		else
			if CityToGuild() then
				MoveToNPC(148, 56, -1, "钱为一"); Sleep(500)
				QuestFrameOptionClicked("帮会银行",1); Sleep(1000)
			end
			return true
		end
	end
end

--[[获取道具栏背包里面的物品并且往对应格子里面扔物品--]]
function findBaseItemsToBank()
	--通过获取当前背包的空余空间来取物品
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(80);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(80);
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1)
		Sleep(80)
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1)
			Sleep(80)
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(80);--获取当前道具栏总共有多少个格子
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(80);--获取当前道具栏总共有多少个格子
        end
        -- 如果是里面的物品则取出来。前提是道具栏空间
        if sName == "藏宝图"  then
            xPos = math.floor(i/5 + 1)
            yPos = i-((xPos-1)*5) + 1
            -- PushDebugMessage("xPos："..xPos..";yPos："..yPos.."物品名称为："..sName);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0)
			Sleep(100)
			--取出帮会银行第16个格子的物品。（当前在第几页，就取当前面的第16个格子的物品
        end
    end 
end

-- 往银行扔藏宝图
function throwTreasureMap()
	--判断是否在银行NPC附近。判断是否打开
	--扔完20次之后再切换到下一个箱子
	--如果打开则每次打开扔20次，不管有没有空间。
	--扔完一轮判断背包里面是否还有图，如果有，则再进行扔，如果没有执行取图操作
	--取图时判断背包里面的空间个数，如果还有空间，则去商会取图，取满则来进行扔图操作
	--无限循环下去，直到取不到图则停止，执行收图操作。
	--收图操作，固定收图120张之后直接 停止 收图。直接 往银行扔图
	--checkNPCDst()
	-- 放图到第2个-第4个箱
	for i = 1,5 do
		checkNPCDst()
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(100)
		findBaseItemsToBank()
		if checkBag() then
			break
		end
	end
	
end

-- 获取背包被占用的格子数量
function getItemNum()
	local tObj = Bag:EnumAllObj()
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

--获取角色一共有多少个格子
function getPlayerBagNums()
    playName = GetPlayerInfo("NAME")
	for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--有--' .. value.num .. ' 格子')
			--获取角色一共有多少个空格子,
			result = getItemNum()
			hasNum1 = value.num1 - result.bag1  -- 物品栏空格子数量
			hasNum2 = value.num2 - result.bag2 -- 材料栏空格子数量
			num1 = value.num1
			num2 = value.num2
			--MessageBox(value.name .. '--有--' .. hasNum1 .. ' 格子'.. hasNum2 .. ' 格子')
		end
	end
	
	return {bag1=hasNum1,bag2=hasNum2,bag1Ori = num1,bag2Ori = num2}
end

-- 取图
function getMaps()
	result = getPlayerBagNums()
	getTu(result.bag1Ori)
	result1 = getPlayerBagNums()
	if result1.bag1 == 0 then
		--toGuild()
		return true
	else
		LoadScript("fn商会.lua") --需要先加载这个模块
		SHQW_OnStart("333", "藏宝图|".. result1.bag1 .."|1") --取出所有藏宝图(可取上架中的)
		--toGuild()
		return true
	end
end

-- 检查背包是否还有图
function checkBag()
	local nfindIdx = Bag:FindBagItem_1("藏宝图")
	if nfindIdx ~= -1 then
		-- 一直往银行扔图
		return false
	end
	return true
end


-- 核心调用，

while true do
	-- 取图逻辑
	if getMaps() ~= true then 
		break
	end
	
	Sleep(500)
	
	-- 检测背包
	if checkBag() == true then 
		break
	else
		PushDebugMessage("准备去帮会")
		toGuild()
		PushDebugMessage("准备循环放图到银行，直到全部放完")
		while true do
			if checkBag() ~= true then
				throwTreasureMap()
			else
				break
			end
		end
	end	
end
--支持输入负数 例：local nNeedMoney = -5*10000,表示仓库只保留5金，其他全部取出来,可用于将多余金币交易给老板
-- 默认取5J 自己可修改
local nNeedMoney = -1
--下面的看不懂不要改
PushDebugMessage("留1铜翻本")
Bank_GetMoney(nNeedMoney)
-----结束----------------------
