-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
local flag = true
local n = 0
local m = 0
local players = {
	--��һ�� ׷��f
	{name = "׷��f",num1 = 30,num2 = 25},
	{name = "�����С����",num1 = 26,num2 = 26},
	{name = "Eternally��L",num1 = 26,num2 = 26},
	{name = "Eternally��L",num1 = 30,num2 = 30},
	{name = "Eternally��L",num1 = 26,num2 = 26},
	{name = "��ѩ���wؼ",num1 = 25,num2 = 25},
	--�ڶ���
	{name = "����һ��ؼ",num1 = 25,num2 = 25},
}

-- �ֿ�ȡͼ�߼�
function getTu(num)
	local strItem = AI_GetParameter_User("ȡͼ��ͼ")
	strItem = " " .. strItem .. " " 
	PushDebugMessage("ȡ����Ʒ��" .. strItem)
	Bank_GetItem(strItem, num)
end

-- �ֿ�ȡͼ�����NPC��
function goGuildNPC()
	if MapName == "����" then
		MoveToNPC(237,236,0,"������");Sleep(1000)
		flag = false
	elseif MapName == "����" then
		MoveToNPC(322,264,1,"������");Sleep(1000)
		flag = false
	elseif MapName == "����" then
		MoveToNPC(179,121,2,"������");Sleep(1000)
		flag = false
	elseif MapName == "¥��" then
		MoveToNPC(191,130,246,"�����v");Sleep(1000)
		flag = false
	else
		ȡ������()
		������()
		local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
		if bUse == false then
			��ͼѰ·("����",347,249)
		end
		MoveToNPC(237,236,0,"������");Sleep(1000)
		flag = false
	end
end

-- �Ӱ��NPC������򿪶Ի�
function toGuild()
	while flag do
	 goGuildNPC()
	 Sleep(100)
	end
	PushDebugMessage("ֱ��ȥ���������")
	QuestFrameOptionClicked("���뱾�����");Sleep(1000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1000)
		QuestFrameOptionClicked("�������",1); Sleep(1000)
	end
end

-- ���NPC���Լ��ľ���
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ǮΪһ" and tonumber(tmp.dst) <= 3 then
			return true
		else
			if CityToGuild() then
				MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(500)
				QuestFrameOptionClicked("�������",1); Sleep(1000)
			end
			return true
		end
	end
end

--[[��ȡ�����������������Ʒ��������Ӧ������������Ʒ--]]
function findBaseItemsToBank()
	--ͨ����ȡ��ǰ�����Ŀ���ռ���ȡ��Ʒ
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(80);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(80);
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1)
		Sleep(80)
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1)
			Sleep(80)
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(80);--��ȡ��ǰ�������ܹ��ж��ٸ�����
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(80);--��ȡ��ǰ�������ܹ��ж��ٸ�����
        end
        -- ������������Ʒ��ȡ������ǰ���ǵ������ռ�
        if sName == "�ر�ͼ"  then
            xPos = math.floor(i/5 + 1)
            yPos = i-((xPos-1)*5) + 1
            -- PushDebugMessage("xPos��"..xPos..";yPos��"..yPos.."��Ʒ����Ϊ��"..sName);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0)
			Sleep(100)
			--ȡ��������е�16�����ӵ���Ʒ������ǰ�ڵڼ�ҳ����ȡ��ǰ��ĵ�16�����ӵ���Ʒ
        end
    end 
end

-- �������Ӳر�ͼ
function throwTreasureMap()
	--�ж��Ƿ�������NPC�������ж��Ƿ��
	--����20��֮�����л�����һ������
	--�������ÿ�δ���20�Σ�������û�пռ䡣
	--����һ���жϱ��������Ƿ���ͼ������У����ٽ����ӣ����û��ִ��ȡͼ����
	--ȡͼʱ�жϱ�������Ŀռ������������пռ䣬��ȥ�̻�ȡͼ��ȡ������������ͼ����
	--����ѭ����ȥ��ֱ��ȡ����ͼ��ֹͣ��ִ����ͼ������
	--��ͼ�������̶���ͼ120��֮��ֱ�� ֹͣ ��ͼ��ֱ�� ��������ͼ
	--checkNPCDst()
	-- ��ͼ����2��-��4����
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

-- ��ȡ������ռ�õĸ�������
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

--��ȡ��ɫһ���ж��ٸ�����
function getPlayerBagNums()
    playName = GetPlayerInfo("NAME")
	for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--��--' .. value.num .. ' ����')
			--��ȡ��ɫһ���ж��ٸ��ո���,
			result = getItemNum()
			hasNum1 = value.num1 - result.bag1  -- ��Ʒ���ո�������
			hasNum2 = value.num2 - result.bag2 -- �������ո�������
			num1 = value.num1
			num2 = value.num2
			--MessageBox(value.name .. '--��--' .. hasNum1 .. ' ����'.. hasNum2 .. ' ����')
		end
	end
	
	return {bag1=hasNum1,bag2=hasNum2,bag1Ori = num1,bag2Ori = num2}
end

-- ȡͼ
function getMaps()
	result = getPlayerBagNums()
	getTu(result.bag1Ori)
	result1 = getPlayerBagNums()
	if result1.bag1 == 0 then
		--toGuild()
		return true
	else
		LoadScript("fn�̻�.lua") --��Ҫ�ȼ������ģ��
		SHQW_OnStart("333", "�ر�ͼ|".. result1.bag1 .."|1") --ȡ�����вر�ͼ(��ȡ�ϼ��е�)
		--toGuild()
		return true
	end
end

-- ��鱳���Ƿ���ͼ
function checkBag()
	local nfindIdx = Bag:FindBagItem_1("�ر�ͼ")
	if nfindIdx ~= -1 then
		-- һֱ��������ͼ
		return false
	end
	return true
end


-- ���ĵ��ã�

while true do
	-- ȡͼ�߼�
	if getMaps() ~= true then 
		break
	end
	
	Sleep(500)
	
	-- ��ⱳ��
	if checkBag() == true then 
		break
	else
		PushDebugMessage("׼��ȥ���")
		toGuild()
		PushDebugMessage("׼��ѭ����ͼ�����У�ֱ��ȫ������")
		while true do
			if checkBag() ~= true then
				throwTreasureMap()
			else
				break
			end
		end
	end	
end
--֧�����븺�� ����local nNeedMoney = -5*10000,��ʾ�ֿ�ֻ����5������ȫ��ȡ����,�����ڽ������ҽ��׸��ϰ�
-- Ĭ��ȡ5J �Լ����޸�
local nNeedMoney = -1
--����Ŀ�������Ҫ��
PushDebugMessage("��1ͭ����")
Bank_GetMoney(nNeedMoney)
-----����----------------------
