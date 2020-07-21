--[[
	脚本功能：实现所有号自动取物品进帮派银行整理
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
-- 通用进帮派
LoadScript("LtoGuild.lua")
---------------------------------------------------------------------
-- 定义好需要整理的物品，
---------------------------------------------------------------------
local bag1Items = {

};

local bag2Items = {

};

---------------------------------------------------------------------
-- 从帮会NPC进入帮会打开对话
---------------------------------------------------------------------
function toGuild()
	while flag do
	 goGuildNPC()
	 Sleep(100)
	end
	PushDebugMessage("#eDC4C18#cFFFF00 直接去本帮城市了")
	QuestFrameOptionClicked("进入本帮城市");Sleep(1000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "钱为一"); Sleep(1000)
		QuestFrameOptionClicked("帮会银行",1); Sleep(1000)
	end
end

---------------------------------------------------------------------
-- 检查NPC离自己的距离
---------------------------------------------------------------------
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

---------------------------------------------------------------------
-- 先将帮派银行里面指定物品取出，这里只能盲取，所以规定好整理的物品放哪几页很重要
---------------------------------------------------------------------
function getItemsFromGuildBank()
    
end

---------------------------------------------------------------------
-- 获取道具栏背包里面的物品并且往对应格子里面扔物品
---------------------------------------------------------------------
function findBaseItemsToBank()
    --道具栏
    for key,value in ipairs(bag1Items) do
        --  查找道具栏物品
        --	返回值：2个(逻辑型 整数型) 是否找到 位置索引
        --  参数1：文本型 		物品名称，只支持精确名字
        --  参数2：整数型 		绑定状态 0无所谓 1不绑的 2绑定的
        local bFind, nIndex = Bag:FindBagItem_DJ(value, 1)
        -- 如果是里面的物品则取出来。前提是道具栏空间
        if bFind then
            xPos = math.floor(nIndex/5 + 1)
            yPos = nIndex-((xPos-1)*5) + 1
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0)
			Sleep(100)
        end
    end 

    -- 材料栏
    for key,value in ipairs(bag2Items) do
        local bFind, nIndex = Bag:FindBagItem_DJ(value, 1)
        if bFind then
            xPos = math.floor(nIndex/5 + 1)
            yPos = nIndex-((xPos-1)*5) + 1
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0)
			Sleep(100)
        end
    end

end
---------------------------------------------------------------------
-- 判断身边有没有一个帮的人员
---------------------------------------------------------------------
function judgementGuildUsersIsNear( ... )
    
    


end

---------------------------------------------------------------------
-- 往银行扔需要整理的物品
---------------------------------------------------------------------
function throwFixUpItems()
	--判断是否在银行NPC附近。判断是否打开
	--扔完20次之后再切换到下一个箱子
	--如果打开则每次打开扔20次，不管有没有空间。
	--扔完一轮判断背包里面是否还有图，如果有，则再进行扔，如果没有执行取图操作
	--取图时判断背包里面的空间个数，如果还有空间，则去商会取图，取满则来进行扔图操作
	--无限循环下去，直到取不到图则停止，执行收图操作。
	--收图操作，固定收图120张之后直接 停止 收图。直接 往银行扔图
	-- 放图到第4个-第5个箱
	for i =4,5 do
		checkNPCDst()
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(100)
		findBaseItemsToBank()
		if checkBag() then
			break
		end
	end
end


---------------------------------------------------------------------
-- 检查背包是否还有图
---------------------------------------------------------------------
function checkBag()
	local nfindIdx = Bag:FindBagItem_1("藏宝图")
	if nfindIdx ~= -1 then
		-- 一直往银行扔图
		return false
	end
	return true
end


---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
while true do
	-- 检测背包
	if checkBag() == true then 
		break
	else
		PushDebugMessage("准备去帮会")
		toGuild()
		PushDebugMessage("准备循环放图到银行，直到全部放完")
		while true do
			if checkBag() ~= true then
				throwFixUpItems()
			else
				break
			end
		end
	end	
end