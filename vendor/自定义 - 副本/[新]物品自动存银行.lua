-- @Author: yulinzhihou
-- @Date:   2018-10-04 23:27:35
-- @Last Modified by:   yulinzhihou
-- @Last Modified time: 2018-10-07 00:42:04
local BaseNum = 20; --[[������ʼ���ܸ�����--]]
local TotalNum = 20;--[[��ǰ��ɫ�ж��ٸ�����--]]
local MaxNum = 30;--[[��ǰ��ɫ���ӵ�еĸ�����--]]
-- ��ȡ��ǰ��������
local xPos,yPos = Player_GetPos();
--[[��鱳�������������Ƿ��ж����һ���հ׿ռ�--]]
function checkBaseBagEmptyNumbs()
    --ͨ����ȡ��ǰ�����Ŀ���ռ���ȡ��Ʒ
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(10);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(10);
    local count = 0;
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1);Sleep(10);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1);Sleep(10);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(10);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(10);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            count = count + 1;
        end
    end
    local Rest_Nums = CurrNum - count;
    if Rest_Nums < 0 then
        PushDebugMessage("�����ռ䲻�����������֮����ִ��");
        return;
    end
end

--[[��鱳�������������Ƿ��ж����һ���հ׿ռ�--]]
function checkMatBagEmptyNumbs()
    --ͨ����ȡ��ǰ�����Ŀ���ռ���ȡ��Ʒ
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(10);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);","",0);Sleep(10);
    local count = 0;
    for i=30,59 do
        local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1);Sleep(10);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1);Sleep(10);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(10);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(10);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            count = count + 1;
        end
    end
    local Rest_Nums = CurrNum - count;
    if Rest_Nums < 0 then
        PushDebugMessage("�����ռ䲻�����������֮����ִ��");
        return;
    end
end

--[[ȡ�����һ���ռ�ĵ�������Ʒ��Ĭ���ǵ�1-6����������Ķ���--]]
function getBaseItemsFromBank()
    for i=1,6 do
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item"..i..":DoAction();","",0);Sleep(400);
    end
end

--[[ȡ�����һ���ռ�Ĳ�������Ʒ��Ĭ���ǵ�7-20����������Ķ���--]]
function getMatItemsFromBank()
    for i=7,20 do
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item"..i..":DoAction();","",0);Sleep(400);
    end
end


--[[Ѱ·ȥ�������NPC�������һ��ռ�--]]
function GotoNPC()
    if xPos ~= 148 and yPos ~= 56 then
        MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
        QuestFrameOptionClicked("�������",1); Sleep(3000)
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(5);","",0);Sleep(1000);
        -- getBaseItemsFromBank();
    else
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(5);","",0);Sleep(1000);
        -- getBaseItemsFromBank();
    end
end

--[[��ȡ�����������������Ʒ--]]
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
        if sName == "�ͼ���ʯ�ϳɷ�" or sName == "��ʯ������3��" or sName == "���齬" or sName == "��������" or sName == "����Ѫ��" or sName == "�Ź���" then
            xPos = math.floor(i/5 + 1);
            yPos = i-((xPos-1)*5) + 1;
            -- PushDebugMessage("xPos��"..xPos..";yPos��"..yPos.."��Ʒ����Ϊ��"..sName);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);--[[ȡ��������е�16�����ӵ���Ʒ������ǰ�ڵڼ�ҳ����ȡ��ǰ��ĵ�16�����ӵ���Ʒ��--]]
        end
    end
end

--[[���Ҳ��ϱ����������Ʒ--]]
function findMatItemsToBank()
    -- �򿪱���������
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);","",0);Sleep(1000);
    for i=30,59 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1);Sleep(200);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1);Sleep(200);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(200);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(200);--[[��ȡ��ǰ�������ܹ��ж��ٸ�����--]]
        end
        --ʣ�¶��ٿհ׵ĸ���
        if sName=="������Ƭ" or sName=="�޲���Ƭ" or sName=="������Ƭ" or sName=="��ľ��" or sName=="����" or sName=="�ʺ�֮��" or sName=="˿��3��" or sName=="Ⱦ��3��" or sName=="׺��ʯ��Ԫ" or sName=="׺��ʯ����" or sName=="׺��ʯ����" or sName=="������" or sName=="����ˮ" or sName=="����Ȫ" then
            local new_i = i - 30;
            xPos = math.floor(new_i/5 + 1);
            yPos = new_i-((xPos-1)*5) + 1;
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(300);--[[ȡ��������е�16�����ӵ���Ʒ������ǰ�ڵڼ�ҳ����ȡ��ǰ��ĵ�16�����ӵ���Ʒ��--]]
        end
    end
end

--[[�ȴ������������--]]
function waitForFriends()
     playName = GetPlayerInfo("NAME");
     players = {
        {"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
        {"Se��ʅ�Z��Y","����Ӱ��","�� �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
        {"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
        {"Eternally��L","Eternally��L","����","","","СС��ͯ2"},
        {"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
        -- {"��������","׷��f","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
    };

    for i=1,5 do
        for j=1,6 do
            if playName == players[i][j] then
                time = (j-1)*120*1000;
                PushDebugMessage(players[i][j].."��Ҫ�ȴ���"..time/60000 .."���Ӻ�����");
                �ȴ�(time);
            end
        end
    end
end

function getItemsFromBagstoBH()
	PushDebugMessage("#eDC4C18#cFFFF00 ���вֿ�����һ��")
	ִ�нű�("�ӹ�����")
	PushDebugMessage("#eDC4C18#cFFFF00 ���вֿ�����һ��---��������")
	ִ�нű�("[����] ��������")
	PushDebugMessage("#eDC4C18#cFFFF00 ���вֿ�����һ��---���ٱ�����")
	ִ�нű�("[��]��ָ����Ʒ")
	local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
	local nCnt = Bank_GetItem(" ���� �������� ��ľ�� ����10�� ���� ��Ѫ��ʯ �ʺ�֮�� ����ͼ ������� �Ź��� ˿��3�� Ⱦ��3�� �߼���Ƭ �޲���Ƭ ������ ������ ϡ���䱦ͼ ������Ƭ ������Ƭ ���캮�� �ͼ���ʯ�ϳɷ� ��ʯ������3�� ����ʯ �嶾�顤Ԫ�� �嶾�顤���� �嶾�顤���� �̾�ʯ(1��) ����ʯ(1��) �ƾ�ʯ(1��) �쾧ʯ(1��) è��ʯ(1��) ����ʯ(1��) ʯ��ʯ(1��) �¹�ʯ(1��) �⾧ʯ(1��) ��ĸ��(1��) ��ʯ(1��) ����(1��) ����(1��) ����(1��) �ʯ(1��) �Ʊ�ʯ(1��) ����ʯ(1��) �̱�ʯ(1��) �ڱ�ʯ(1��) �챦ʯ(1��) ׺��ʯ��Ԫ ׺��ʯ���� ׺��ʯ���� ������ ������ ����ˮ ����Ѫ�� ����Ȫ ", 31,1)
	-----��ʼ----------------------
	local MapName = GetActiveSceneName()
	--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
	if MapName == "����" then
		MoveToNPC(237,236,0,"������");Sleep(1000)
	elseif MapName == "����" then
		MoveToNPC(322,264,1,"������");Sleep(1000)
	elseif MapName == "����" then
		MoveToNPC(179,121,2,"������");Sleep(1000)
	elseif MapName == "¥��" then
		MoveToNPC(191,130,246,"�����v");Sleep(1000)
	else
		ִ�нű�("[����] �س�")
		MoveToNPC(237,236,0,"������");Sleep(1000)
	end
	QuestFrameOptionClicked("���뱾�����");Sleep(3000)
	-----����----------------------
end

ִ�нű�("[��]�Զ����μ�");Sleep(1000)
--ȡ�ֿⶫ��ȥ���ȴ�
getItemsFromBagstoBH()
--�ȴ�*���Ӻ�����
waitForFriends();
--��鱳�������������Ƿ��ж����һ���հ׿ռ�--
checkBaseBagEmptyNumbs();
--��鱳�������������Ƿ��ж����һ���հ׿ռ�--
checkMatBagEmptyNumbs();
GotoNPC();
--ȡ����Ʒ
getBaseItemsFromBank();
getMatItemsFromBank();
--������Ʒ
findBaseItemsToBank();
findMatItemsToBank();