--[[
	�ű����ܣ�ʵ�����к��Զ�ȡ��Ʒ��������������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
-- ͨ�ý�����
LoadScript("LtoGuild.lua")
---------------------------------------------------------------------
-- �������Ҫ�������Ʒ��
---------------------------------------------------------------------
local bag1Items = {

};

local bag2Items = {

};

---------------------------------------------------------------------
-- �Ӱ��NPC������򿪶Ի�
---------------------------------------------------------------------
function toGuild()
	while flag do
	 goGuildNPC()
	 Sleep(100)
	end
	PushDebugMessage("#eDC4C18#cFFFF00 ֱ��ȥ���������")
	QuestFrameOptionClicked("���뱾�����");Sleep(1000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1000)
		QuestFrameOptionClicked("�������",1); Sleep(1000)
	end
end

---------------------------------------------------------------------
-- ���NPC���Լ��ľ���
---------------------------------------------------------------------
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

---------------------------------------------------------------------
-- �Ƚ�������������ָ����Ʒȡ��������ֻ��äȡ�����Թ涨���������Ʒ���ļ�ҳ����Ҫ
---------------------------------------------------------------------
function getItemsFromGuildBank()
    
end

---------------------------------------------------------------------
-- ��ȡ�����������������Ʒ��������Ӧ������������Ʒ
---------------------------------------------------------------------
function findBaseItemsToBank()
    --������
    for key,value in ipairs(bag1Items) do
        --  ���ҵ�������Ʒ
        --	����ֵ��2��(�߼��� ������) �Ƿ��ҵ� λ������
        --  ����1���ı��� 		��Ʒ���ƣ�ֻ֧�־�ȷ����
        --  ����2�������� 		��״̬ 0����ν 1����� 2�󶨵�
        local bFind, nIndex = Bag:FindBagItem_DJ(value, 1)
        -- ������������Ʒ��ȡ������ǰ���ǵ������ռ�
        if bFind then
            xPos = math.floor(nIndex/5 + 1)
            yPos = nIndex-((xPos-1)*5) + 1
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0)
			Sleep(100)
        end
    end 

    -- ������
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
-- �ж������û��һ�������Ա
---------------------------------------------------------------------
function judgementGuildUsersIsNear( ... )
    
    


end

---------------------------------------------------------------------
-- ����������Ҫ�������Ʒ
---------------------------------------------------------------------
function throwFixUpItems()
	--�ж��Ƿ�������NPC�������ж��Ƿ��
	--����20��֮�����л�����һ������
	--�������ÿ�δ���20�Σ�������û�пռ䡣
	--����һ���жϱ��������Ƿ���ͼ������У����ٽ����ӣ����û��ִ��ȡͼ����
	--ȡͼʱ�жϱ�������Ŀռ������������пռ䣬��ȥ�̻�ȡͼ��ȡ������������ͼ����
	--����ѭ����ȥ��ֱ��ȡ����ͼ��ֹͣ��ִ����ͼ������
	--��ͼ�������̶���ͼ120��֮��ֱ�� ֹͣ ��ͼ��ֱ�� ��������ͼ
	-- ��ͼ����4��-��5����
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
-- ��鱳���Ƿ���ͼ
---------------------------------------------------------------------
function checkBag()
	local nfindIdx = Bag:FindBagItem_1("�ر�ͼ")
	if nfindIdx ~= -1 then
		-- һֱ��������ͼ
		return false
	end
	return true
end


---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
while true do
	-- ��ⱳ��
	if checkBag() == true then 
		break
	else
		PushDebugMessage("׼��ȥ���")
		toGuild()
		PushDebugMessage("׼��ѭ����ͼ�����У�ֱ��ȫ������")
		while true do
			if checkBag() ~= true then
				throwFixUpItems()
			else
				break
			end
		end
	end	
end