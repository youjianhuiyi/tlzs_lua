playName;
n = 0;
m = 0;
MapName = GetActiveSceneName();
getMapNum = 0;
originBagNums;
flag = true;
players = {
	--��һ�� ׷��f
	{name = "�������꣮��",	num1 = 30,num2 = 30},
	{name = "�壮���٩c",	num1 = 26,num2 = 30},
	{name = "�m���գ���",	num1 = 26,num2 = 30},
	{name = "��ѩ��",		num1 = 30,num2 = 25},
	{name = "ؼ����������",	num1 = 30,num2 = 30},
	{name = "ƽ����",		num1 = 26,num2 = 30},
	--�ڶ���
	{name = "Se��ʅ�Z��Y",	num1 = 30,num2 = 30},
	{name = "����Ӱ����",		num1 = 30,num2 = 30},
	{name = "�nᰩf���",	num1 = 25,num2 = 30},
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
};

-- �سǵ�����NPC��
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


-- �ֿ��ͼ�߼�
function saveTu()
	Bank_SaveItem("�ر�ͼ", false, 0)
end


-- ��ȡ������ռ�õĸ�������
function getItemNum()
	local tObj = Bag:EnumAllObj();
	local n = 0;
	local m = 0;
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1; --������ռ�ø���
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1; --������ռ�ø���
		end
	end
	return n,m;
end


--��ȡ��ɫһ���ж��ٸ�����
function getPlayerBagNums()
    playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--��--' .. value.num .. ' ����')
			--��ȡ��ɫһ���ж��ٸ��ո���,
			local res1,res2 = getItemNum()
			hasNum1 = value.num1 - res1 -- ��Ʒ���ո�������
			hasNum2 = value.num2 - res2 -- �������ո�������
			--[[num1 = value.num1 --��Ʒ���ܸ�������
			num2 = value.num2 --�������ܸ�������--]]
			-- MessageBox(value.name .. '--��--' .. hasNum1 .. ' ����'.. hasNum2 .. ' ����')
		end
	end
	--return {bag1=hasNum1,bag2=hasNum2,bag1Ori = num1,bag2Ori = num2}
	return  hasNum1,hasNum2,res1,res2;
end


-- �Ӱ��NPC������򿪶Ի�
function toGuild()
	while flag do
		goGuildNPC()
	end
	PushDebugMessage("ֱ��ȥ���������")
	QuestFrameOptionClicked("���뱾�����");Sleep(3000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
		QuestFrameOptionClicked("�������",1); Sleep(3000)
	end
end 


--[[ȡ�ر�ͼ�������������Ʒ--]]
function getBaseItemsFromBank(num)
	Sleep(1000)
    for j=1,20 do
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item".. j ..":DoAction();","",0)
		Sleep(100)
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

-- ������ȡ�ر�ͼ
function getTreasureMap()
	res3 = getPlayerBagNums()
	-- �ӵ�2��-��4����������ȡͼ
	for i = 2,4 do
		checkNPCDst()
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(100)
		getBaseItemsFromBank(res3.bag1Ori)
		res4 = getPlayerBagNums()
		--[[
		MessageBox("result1.bag1--" .. result1.bag1)
		MessageBox("result1.bag2--" .. result1.bag2)
		MessageBox("result1.bag1Ori--" .. result1.bag1Ori)
		MessageBox("result1.bag2Ori--" .. result1.bag2Ori)
		--]]
		if res4.bag1 == 0 then
			break
		end
	end
end

-- �Ӳֿ���ȡ����Ӧ������ͼƬ������ͼ
function getDetailMaps(num)
	local strItem = AI_GetParameter_User("ȡͼ��ͼ") 
	strItem = " " .. strItem .. " " 
	PushDebugMessage("ȡ����Ʒ��" .. strItem)
	Bank_GetItem(strItem, num)
end


-- ���ĵ���

--�洢ԭʼ���ݣ�ԭʼ���������ж��ٸ�����
function getPlayerBagNums_1()
    playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--��--' .. value.num .. ' ����')
			--��ȡ��ɫһ���ж��ٸ��ո���,
			res1 = getItemNum()
			val_1 = res1.bag1
			val_2 = res1.bag2
			hasNum_01 = value.num1 - res1.bag1 -- ��Ʒ���ո�������
			hasNum_02 = value.num2 - res1.bag2 -- �������ո�������
			num_01 = value.num1 --��Ʒ���ܸ�������
			num_02 = value.num2 --�������ܸ�������
			-- getMapNum = hasNum1
			--
			-- MessageBox(value.name .. '--��--' .. hasNum1 .. ' ����'.. hasNum2 .. ' ����')
		end
	end
	return {bag_01=hasNum_01,bag_02=hasNum_02,bag1Ori_01 = num_01,bag2Ori_02 = num_02,val_1 = val_1,val_2 = val_2}
end

ִ�нű�("[����] ��������")
ִ�нű�("[��]��ͼר�����")
toGuild() -- ��ȥ���
-- ִ��ȡͼ�߼�
while true do 
	res5 = getPlayerBagNums()
	Sleep(100)
	if res5.bag1 ~= 0 then
		for a = 1, 100  do
			getTreasureMap()
			break
		end
	else
		break
	end
end

-- ȡ��һ����׼������ֿ�
saveTu()

-- �ٸ��ݾ������ȡ����Ӧ��ͼ 
originBagNums = getPlayerBagNums_1()
-- while true do
	-- MessageBox("originBagNums.bag1--" .. originBagNums.bag_01)
	-- MessageBox("originBagNums.bag2--" .. originBagNums.bag_02)
	-- MessageBox("originBagNums.val_1--" .. originBagNums.val_1)
	-- MessageBox("originBagNums.val_2--" .. originBagNums.val_2)
	-- MessageBox("originBagNums.bag1Ori--" .. originBagNums.bag1Ori_01)
	-- MessageBox("originBagNums.bag2Ori--" .. originBagNums.bag2Ori_02)
-- end

getDetailMaps(originBagNums.bag_01 - 1)
PushDebugMessage("׼�����")
ִ�нű�("[��]��ͼר�����")
PushDebugMessage("׼����ͼ")
ִ�нű�("�Զ��ڲر�ͼ")
PushDebugMessage("׼�����")
ִ�нű�("[��]��ͼר�����")