--[[
	�ű����ã�����ɫ���ϵ�Ԫ���һ���Ԫ��Ʊ���Զ�������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 ���Ա༭�޸ı���������")
-- Ҫ���������һ���Ԫ��Ʊ��Ԫ������ ======������Ҫ����======
local BaoLiu = 0
local nTick = 0
local yuanbao = Player:GetDataInt('YUANBAO')


---------------------------------------------------------------------
-- ȥǮׯ�һ�Ԫ��Ʊ
---------------------------------------------------------------------
function exchangeYB()
	while true do
		-- ��ȡ��ǰԪ������
		local yuanbao = Player:GetDataInt('YUANBAO')
		-- Ԫ�������˳��һ�
		if yuanbao <= BaoLiu then break end
		--ǰ��Ǯׯ
		MoveToNPC(65, 42, 224, "�����"); Sleep(600)
		-- ��ȡ��ʼ�һ�ʱ��
		if nTick == 0 then nTick = GetTickCount() end
		-- ����30���˳��һ�
		if nTick ~= 0 and GetTickCount() - nTick > 30 * 1000 then break end
		-- ������Ҫ�һ�������
		local nNeed = yuanbao - BaoLiu
		-- ÿ�ζһ�������50000Ԫ��
		if nNeed > 50000 then nNeed = 50000 end
		if nNeed <= 0 then break end
		-- ��ʼ�һ�
		Player:YB2Ticket(nNeed)
		Sleep(1000)
	end
end


---------------------------------------------------------------------
-- ��ȡ�����������������Ʒ
---------------------------------------------------------------------
function findBaseItemsToBank()
    --ͨ����ȡ��ǰ�����Ŀ���ռ���ȡ��Ʒ
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(1000);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(1000);
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1);Sleep(100);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1);Sleep(100);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(100);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(100);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
        end
        -- ������������Ʒ��ȡ������ǰ���ǵ������ռ�
        if sName == "Ԫ��Ʊ" then
            xPos = math.floor(i/5 + 1);
            yPos = i-((xPos-1)*5) + 1;
            -- PushDebugMessage("xPos��"..xPos..";yPos��"..yPos.."��Ʒ����Ϊ��"..sName);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(1);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(2);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(3);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(4);","",0);Sleep(1000);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);
			sName = nil;
			--[[ȡ��������е�16�����ӵ���Ʒ������ǰ�ڵڼ�ҳ����ȡ��ǰ��ĵ�16�����ӵ���Ʒ��--]]
        end
    end
end


---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
PushDebugMessage("#eDC4C18#cFFFF00�һ����Ԫ��Ʊ���Զ����������У���")
while true do
	if yuanbao > 0 then
		exchangeYB();
		yuanbao = Player:GetDataInt('YUANBAO')
		if CityToGuild() then
			MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
			QuestFrameOptionClicked("�������",1); Sleep(3000)
			findBaseItemsToBank();
		end
	else
		local bFind, nIndex = Bag:FindBagItem_DJ("Ԫ��Ʊ", 0)
		if bFind == true and nIndex ~= -1 then
			if CityToGuild() then
				MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
				QuestFrameOptionClicked("�������",1); Sleep(3000)
				findBaseItemsToBank();
			end
		else
			break;
		end
	end
end