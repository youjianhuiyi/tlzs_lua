--[[
	脚本作用：将角色身上的元宝兑换成元宝票，自动存银行
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 可以编辑修改保留的数量")
-- 要保留、不兑换成元宝票的元宝数量 ======根据需要设置======
local BaoLiu = 0
local nTick = 0
local yuanbao = Player:GetDataInt('YUANBAO')


---------------------------------------------------------------------
-- 去钱庄兑换元宝票
---------------------------------------------------------------------
function exchangeYB()
	while true do
		-- 获取当前元宝数量
		local yuanbao = Player:GetDataInt('YUANBAO')
		-- 元宝不足退出兑换
		if yuanbao <= BaoLiu then break end
		--前往钱庄
		MoveToNPC(65, 42, 224, "孙进宝"); Sleep(600)
		-- 获取起始兑换时间
		if nTick == 0 then nTick = GetTickCount() end
		-- 超过30秒退出兑换
		if nTick ~= 0 and GetTickCount() - nTick > 30 * 1000 then break end
		-- 计算需要兑换的数量
		local nNeed = yuanbao - BaoLiu
		-- 每次兑换不超过50000元宝
		if nNeed > 50000 then nNeed = 50000 end
		if nNeed <= 0 then break end
		-- 开始兑换
		Player:YB2Ticket(nNeed)
		Sleep(1000)
	end
end


---------------------------------------------------------------------
-- 获取道具栏背包里面的物品
---------------------------------------------------------------------
function findBaseItemsToBank()
    --通过获取当前背包的空余空间来取物品
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(1000);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(1000);
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1);Sleep(100);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1);Sleep(100);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(100);--[[获取当前道具栏总共有多少个格子--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(100);--[[获取当前道具栏总共有多少个格子--]]
        end
        -- 如果是里面的物品则取出来。前提是道具栏空间
        if sName == "元宝票" then
            xPos = math.floor(i/5 + 1);
            yPos = i-((xPos-1)*5) + 1;
            -- PushDebugMessage("xPos："..xPos..";yPos："..yPos.."物品名称为："..sName);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(1);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(2);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(3);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(4);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			sName = nil;
			--[[取出帮会银行第16个格子的物品。（当前在第几页，就取当前面的第16个格子的物品）--]]
        end
    end
end


---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
PushDebugMessage("#eDC4C18#cFFFF00兑换完的元宝票会自动存入帮会银行！！")
while true do
	if yuanbao > 0 then
		exchangeYB();
		yuanbao = Player:GetDataInt('YUANBAO')
		if CityToGuild() then
			MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
			QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
			findBaseItemsToBank();
		end
	else
		local bFind, nIndex = Bag:FindBagItem_DJ("元宝票", 0)
		if bFind == true and nIndex ~= -1 then
			if CityToGuild() then
				MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
				QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
				findBaseItemsToBank();
			end
		else
			break;
		end
	end
end