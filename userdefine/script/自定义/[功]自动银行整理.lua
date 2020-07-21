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
-- bag1Items �ǵ�������Ʒ
-- bag2Items �ǲ�������Ʒ
---------------------------------------------------------------------
local bag1Items = {
    "�ͼ����޻�ͯ����","�м����޻�ͯ����","�߼����޻�ͯ����","�������޻�ͯ����","�߼����޻�ͯ����","�ͼ���ʯ�ϳɷ�","��ʯ������3��",
    "��������","׺��ʯ��Ԫ","׺��ʯ����","׺��ʯ����","������","����ˮ","����Ѫ��","����Ȫ","���齬",
};

local bag2Items = {
    "�̾�ʯ(1��)","����ʯ(1��)","�ƾ�ʯ(1��)","�쾧ʯ(1��)","è��ʯ(1��)",
    "����ʯ(1��)","ʯ��ʯ(1��)","�¹�ʯ(1��)","�⾧ʯ(1��)","��ĸ��(1��)",
    "��ʯ(1��)","����(1��)","����(1��)","����(1��)","�ʯ(1��)",
    "�Ʊ�ʯ(1��)","����ʯ(1��)","�̱�ʯ(1��)","�ڱ�ʯ(1��)","�챦ʯ(1��)",
    "˿��3��","Ⱦ��3��","��ľ��","����","�ʺ�֮��","�Ź���","������Ƭ","�޲���Ƭ","������Ƭ"
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
function judgementGuildUsersIsNear()
    --��һ��
	--������Χ���ж�������,����������
	--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
	--id,���ƣ����ͣ��ƺţ�x���꣬y���꣬���룬Ѫ��GUID,����ӵ����id�����ɣ�����ӵ����id,״̬���������ͣ��ȼ���Ŀ��id,ģ��id�����id,�Ƿ��ڶ��飬�Ƿ�ӳ�
	local tObj = Enum2XAllObj()
	--�������͡� ����2�����δ��� {NPC,�����ң����ޣ�����} 0�ų���1������
	tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})
	--���˰��id,���ذ��idΪ84�Ķ���
	tObj = ObjFilterByBHID(tObj, " 52 ")
	for i = 1, #tObj do
		local tmp = tObj[i]
		--ȡ��ɫ���ơ��Ա������������,������ų������ڵĶӣ�����Ҫ����������������Ŷ����ڵĶӣ���Ҫ�˶ӡ�
		--����Ӧ��Ҫ������ŵĶ�������ת�����ַ������в��ң���Ա��û�е���
		local masterStr = table.concat(allPlayers, ", ", key1, key2 )
		if string.find( masterStr,tmp.name) ~= nil then
            return false
        else
            return true;
		end
	end
end

---------------------------------------------------------------------
-- ����������Ҫ�������Ʒ
---------------------------------------------------------------------
function throwFixUpItems(startIndex,endIndex)
	--�ж��Ƿ�������NPC�������ж��Ƿ��
	--����20��֮�����л�����һ������
	--�������ÿ�δ���20�Σ�������û�пռ䡣
	--����һ���жϱ��������Ƿ���ͼ������У����ٽ����ӣ����û��ִ��ȡͼ����
	--ȡͼʱ�жϱ�������Ŀռ������������пռ䣬��ȥ�̻�ȡͼ��ȡ������������ͼ����
	--����ѭ����ȥ��ֱ��ȡ����ͼ��ֹͣ��ִ����ͼ������
	--��ͼ�������̶���ͼ120��֮��ֱ�� ֹͣ ��ͼ��ֱ�� ��������ͼ
	-- ��ͼ����4��-��5����
    if startIndex == 1 and endIndex == 4 then
        for i = startIndex,endIndex do
            checkNPCDst()
            if judgementGuildUsersIsNear() then
                GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
                Sleep(100)
                -- Ȼ���ٸ���ָ����Ʒ��������
                findBaseItemsToBank()
            else
                PushDebugMessage("#eDC4C18#cFFFF00 �����ĵȴ��������в���������ԣ���");
            end
        end
    else
        for i = startIndex,endIndex do
            checkNPCDst()
            if judgementGuildUsersIsNear() then
                GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
                Sleep(100)
                -- �ȴ�һҳ����ȡ��������Ʒ
                getItemsFromGuildBank();
                -- Ȼ���ٸ���ָ����Ʒ��������
                findBaseItemsToBank()
            else
                PushDebugMessage("#eDC4C18#cFFFF00 �����ĵȴ��������в���������ԣ���");
            end
        end
    end
    
end


---------------------------------------------------------------------
-- ��鱳���Ƿ���ͼ
---------------------------------------------------------------------
function checkBag()
    local allBagsItems = table.concat( bag1Items,bag2Items);
    
    for k,v in ipairs(allBagsItems) do
       --���ҵ���+����+����,�����ͳ�������ҵ������� (3������ֵ)
        --	����ֵ��3��(�߼��� ������ ������) �Ƿ��ҵ� �������� λ������
        --  ����1���ı���		��Ʒ���ƣ�ֻ֧�־�ȷ����
        local bFind, nCount, nIndex = Bag:FindBagItem_All(v);
        if bFind then
            -- ��ʾ����������û�д������Ʒ���������������Ʒ�Ѿ����ˣ����ʱ����Ҫ�����ǰ����
            return false;
        else
            -- ��ʾ�����������Ʒ�Ѿ�ȫ�����ȥ�ˡ���������
            return true;
        end
    end
end


---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
while true do
	-- ��ⱳ��
    if checkBag() == true then 
        PushDebugMessage("#eDC4C18#cFFFF00 �Ѿ�������ɣ�����������");
        LoadScript("[��]�س�");
		break;
	else
		PushDebugMessage("#eDC4C18#cFFFF00 ׼��ȥ���")
		toGuild()
        PushDebugMessage("#eDC4C18#cFFFF00 ׼��ѭ����ͼ�����У�ֱ��ȫ������");
        -- ѭ�� 5 �δ棬��������λ�û���꣬�����������Ӵ�ֿ�
        for i=1,2 do
			if checkBag() ~= true and i == 1 then
				throwFixUpItems(4,5)
            elseif checkBag() ~= true and i == 2 then 
                -- �����2�λ�û���꣬��ʾ�϶���ָ����������
                throwFixUpItems(1,4)
            else
				break
            end
		end
	end	
end