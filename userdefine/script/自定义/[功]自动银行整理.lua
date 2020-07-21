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
-- bag1Items 是道具栏物品
-- bag2Items 是材料栏物品
---------------------------------------------------------------------
local bag1Items = {
    "低级珍兽还童天书","中级珍兽还童天书","高级珍兽还童天书","超级珍兽还童天书","高级珍兽还童卷轴","低级宝石合成符","宝石雕琢符3级",
    "龙纹玉灵","缀龙石·元","缀龙石·伤","缀龙石·暴","玉龙髓","净云水","铸纹血玉","玉华灵泉","释灵浆",
};

local bag2Items = {
    "绿晶石(1级)","蓝晶石(1级)","黄晶石(1级)","红晶石(1级)","猫眼石(1级)",
    "虎眼石(1级)","石榴石(1级)","月光石(1级)","尖晶石(1级)","祖母绿(1级)",
    "变石(1级)","黄玉(1级)","碧玺(1级)","紫玉(1级)","皓石(1级)",
    "黄宝石(1级)","蓝宝石(1级)","绿宝石(1级)","黑宝石(1级)","红宝石(1级)",
    "丝线3级","染料3级","麟木箭","丹青","彩虹之箭","九宫盒","精铁碎片","棉布碎片","秘银碎片"
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
    for i=1,20 do
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item".. i ..":DoAction();","",0);
        Sleep(50)
    end
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_EnvMainMenuBar_Packet_Clicked();","",0);Sleep(50)
    GetLuaValue("setmetatable(_G, {__index = Packet_EnvPacket_ChangeTabIndex(0);","",0);Sleep(50)
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();","",0);Sleep(50)
    GetLuaValue("setmetatable(_G, {__index = Packet_EnvPacket_ChangeTabIndex(1);","",0);Sleep(50)
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();","",0);Sleep(50)
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
function judgementGuildUsersIsNear()
    --第一队
	--遍历周围所有对象数组,有以下属性
	--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
	--id,名称，类型，称号，x坐标，y坐标，距离，血，GUID,怪物拥有者id，门派，珍兽拥有者id,状态，作物类型，等级，目标id,模型id，帮会id,是否在队伍，是否队长
	local tObj = Enum2XAllObj()
	--过滤类型。 参数2：依次代表 {NPC,怪物，玩家，珍兽，宝箱} 0排除，1保留，
	tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})
	--过滤帮会id,返回帮会id为84的对象
	tObj = ObjFilterByBHID(tObj, " 52 ")
	for i = 1, #tObj do
		local tmp = tObj[i]
		--取角色名称。对比上面队伍名称,如果是团长号所在的队，不需要做操作，如果不是团队所在的队，需要退队。
		--将对应需要申请进团的队伍名称转换成字符串进行查找，人员有没有到齐
		local masterStr = table.concat(allPlayers, ", ", key1, key2 )
		if string.find( masterStr,tmp.name) ~= nil then
            return false
        else
            return true;
		end
	end
end

---------------------------------------------------------------------
-- 往银行扔需要整理的物品
---------------------------------------------------------------------
function throwFixUpItems(startIndex,endIndex)
	--判断是否在银行NPC附近。判断是否打开
	--扔完20次之后再切换到下一个箱子
	--如果打开则每次打开扔20次，不管有没有空间。
	--扔完一轮判断背包里面是否还有图，如果有，则再进行扔，如果没有执行取图操作
	--取图时判断背包里面的空间个数，如果还有空间，则去商会取图，取满则来进行扔图操作
	--无限循环下去，直到取不到图则停止，执行收图操作。
	--收图操作，固定收图120张之后直接 停止 收图。直接 往银行扔图
	-- 放图到第4个-第5个箱
    if startIndex == 1 and endIndex == 4 then
        for i = startIndex,endIndex do
            checkNPCDst()
            if judgementGuildUsersIsNear() then
                GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
                Sleep(100)
                -- 然后再根据指定物品往里面扔
                findBaseItemsToBank()
            else
                PushDebugMessage("#eDC4C18#cFFFF00 请耐心等待其他大佬操作完成再试！！");
            end
        end
    else
        for i = startIndex,endIndex do
            checkNPCDst()
            if judgementGuildUsersIsNear() then
                GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
                Sleep(100)
                -- 先从一页里面取出所有物品
                getItemsFromGuildBank();
                -- 然后再根据指定物品往里面扔
                findBaseItemsToBank()
            else
                PushDebugMessage("#eDC4C18#cFFFF00 请耐心等待其他大佬操作完成再试！！");
            end
        end
    end
    
end


---------------------------------------------------------------------
-- 检查背包是否还有图
---------------------------------------------------------------------
function checkBag()
    local allBagsItems = table.concat( bag1Items,bag2Items);
    
    for k,v in ipairs(allBagsItems) do
       --查找道具+材料+任务,会叠加统计所有找到的数量 (3个返回值)
        --	返回值：3个(逻辑型 整数型 整数型) 是否找到 所有数量 位置索引
        --  参数1：文本型		物品名称，只支持精确名字
        local bFind, nCount, nIndex = Bag:FindBagItem_All(v);
        if bFind then
            -- 表示背包里面有没有存完的物品，可能是里面的物品已经满了，这个时候需要随机往前面扔
            return false;
        else
            -- 表示背包里面的物品已经全部存进去了。可以走了
            return true;
        end
    end
end


---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
while true do
	-- 检测背包
    if checkBag() == true then 
        PushDebugMessage("#eDC4C18#cFFFF00 已经整理完成，可以闪人了");
        LoadScript("[新]回城");
		break;
	else
		PushDebugMessage("#eDC4C18#cFFFF00 准备去帮会")
		toGuild()
        PushDebugMessage("#eDC4C18#cFFFF00 准备循环放图到银行，直到全部放完");
        -- 循环 5 次存，如果第三次还没存完，尝试其他格子存仓库
        for i=1,2 do
			if checkBag() ~= true and i == 1 then
				throwFixUpItems(4,5)
            elseif checkBag() ~= true and i == 2 then 
                -- 如果第2次还没存完，表示肯定是指定格子满了
                throwFixUpItems(1,4)
            else
				break
            end
		end
	end	
end