--[[
    �ű����ܣ���������ȡͼ��ͼ������Ŀ��ʱֹͣʹ�ã����ڿ���
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local players = {
		--��һ�� ׷��f
		{name = "�������꣮��",	num1 = 30,num2 = 30},
		{name = "�壮���٩c",	num1 = 26,num2 = 30},
		{name = "�m���գ���",	num1 = 26,num2 = 30},
		{name = "��ѩ��",		num1 = 30,num2 = 25},
		{name = "ؼ����������",	num1 = 30,num2 = 30},
		{name = "ƽ����",		num1 = 26,num2 = 30},
		--�ڶ���
		{name = "Se��ʅ�Z��Y",	num1 = 30,num2 = 30},
		{name = "����Ӱ��",		num1 = 30,num2 = 30},
		{name = "�� �nᰩf���",	num1 = 25,num2 = 30},
		{name = "������������",	num1 = 30,num2 = 26},
		{name = "�t��TeaRİ�f",	num1 = 30,num2 = 26},
		{name = "Am��ϧ������",	num1 = 26,num2 = 30},
		--������
		{name = "��Ҽ�~�u�ͤ�",	num1 = 30,num2 = 30},
		{name = "�n�ƶ����f",	num1 = 30,num2 = 30},
		{name = "����֮��",		num1 = 30,num2 = 30},
		{name = "���հ��~��",	num1 = 30,num2 = 30},
		{name = "��FЦ��D��",	num1 = 30,num2 = 30},
		{name = "�����Ļز�",	num1 = 30,num2 = 30},
		--���Ķ�
		{name = "�����S�O����",	num1 = 30,num2 = 30},
		{name = "��m������",	num1 = 30,num2 = 26},
		{name = "������",		num1 = 30,num2 = 30},
		{name = "TH��Ī��",		num1 = 30,num2 = 30},
		{name = "��n��������",	num1 = 30,num2 = 26},
		{name = "СС��ͯ2",	num1 = 30,num2 = 30},
		--�����
		{name = "��������",		num1 = 30,num2 = 30},
		{name = "��������",		num1 = 30,num2 = 30},
		{name = "�鶨����ؼ",	num1 = 30,num2 = 30},
		{name = "���~��",		num1 = 27,num2 = 30},
		{name = "���c꿡�",	num1 = 30,num2 = 30},
		{name = "���ڽ�ӵ���f",	num1 = 30,num2 = 30},
		--������
		{name = "СҶؼ��ɱ",	num1 = 30,num2 = 30},
		{name = "�޸��_����",	num1 = 30,num2 = 30},
		{name = "����С��",	num1 = 30,num2 = 30},
		{name = "�耣��g",		num1 = 27,num2 = 30},
		{name = "�n�ϣ������f",	num1 = 30,num2 = 30},
		{name = "��Lynthia",	num1 = 30,num2 = 30},
		{name = "�����С����",	num1 = 26,num2 = 26},
		--��ͼһ�Ӻ�
		{name = "��ѩ���wؼ",	num1 = 25,num2 = 25},
		{name = "����",			num1 = 26,num2 = 26},
		{name = "������",		num1 = 25,num2 = 30},
		{name = "XXؼ",			num1 = 26,num2 = 26},
		{name = "׷��f",		num1 = 30,num2 = 28},
		{name = "Eternally��L",	num1 = 30,num2 = 30},
		{name = "����һ��ؼ",	num1 = 25,num2 = 25},
	}

--��ȡ��ɫ�ж��ٸ�����
function getPlayerBagNums()
    local playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			return value.num1,value.num2
		end
	end
end

-- ��ȡ�����ո�������
function Bag_GetSpaceNum()
	local tObj = Bag:EnumAllObj()
	local Bag_rest_1 = 0
	local Bag_rest_2 = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			--��ʾ�ǵ������Ŀռ�
			Bag_rest_1 = Bag_rest_1 + 1; 
		elseif tmp.index <= 59 then 
			--��ʾ�ǲ������Ŀռ�
			Bag_rest_2 = Bag_rest_2 + 1; 
		else
			return false;
		end
	end
	return Bag_rest_1,Bag_rest_2;
end

-- �Ӱ������NPC�򿪶Ի�
-- ���NPC���Լ��ľ���
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ǮΪһ" and tonumber(tmp.dst) <= 3 then
			MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(500)
			QuestFrameOptionClicked("�������",1); Sleep(1000)
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

-- ������ȡ�ر�ͼ
function getTreasureMap()
	-- �ӵ�1��-��5����������ȡͼ
	checkNPCDst()
	local num1,num2 = getPlayerBagNums()
	for i = 1,5 do
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(1000)
		--ȡͼ
		for j=1,20 do
			local res1,res2 = Bag_GetSpaceNum()
			if num1 - res1 <= 3 then
				return true;
			end
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item".. j ..":DoAction();","",0)
			Sleep(200)
			--ȡͼ
			PushDebugMessage("�Ѿ��õ������� = ".. res1 .. "��");Sleep(200)
			PushDebugMessage("�Ѿ��ò������� = ".. res2 .. "��");Sleep(200)
		end
	end
	return false;
end

-- ���ĵ���
getTreasureMap()