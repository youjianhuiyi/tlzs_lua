PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ�����ߵ�NPC�����븱��ˢ��");
local activeScene = GetActiveSceneName()
local npcs = {}
AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ

-------------------------------------------------------
-- ��ḱ��NPCѰ�ҵ�·��
-------------------------------------------------------
local findNPC = {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},

};

-------------------------------------------------------
--���а�����
-------------------------------------------------------
local city = {
	{35,243,150,'��������Уξ'},
	{35,80,139,'��������Уξ'}
};

---------------------------------
--- ˢ�ֵ�����㣬��˳���������ˢ
---------------------------------
local position = {
	{67,98},
	{51,92},
	{43,67},
	{46,48},
	{65,57},
	{134,54},
	{149,45},
	{148,61},
	{147,98},
	{130,100},
	{99,57}
};

-----------------------------------------------------------
-- ������������������ǰ����û�й����ʱ�����������ˢ��
-----------------------------------------------------------
local test_position = {
	{},
	{},
	{},
	{},
	{},
	{},
};




-----------------------------------------------------------
-- ������������������ǰ����û�й����ʱ�����������ˢ��
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name);
		-- npcs[key] = {value.name , value.class , value.x , value.y , value.dst}
		if value.class == "����" then
			count = count + 1
		end
	end
	
	while true do 
		PushDebugMessage("��ǰcount����ֵΪ��"..count);Sleep(500)
		if count == 0 then
			return false
		else
			return true
		end
	end
end

------------------------------------------------------
-- �����ֽű�
------------------------------------------------------
function DaGuai(xpos,ypos)
	DG_OnInit();
	DG_SetParam("��ַ�ʽ", "���̺��");
	DG_SetParam("����ģʽ", "�����̹�");
	DG_SetParam("Ŀ��","����");
	DG_SetParam("�Ƿ�ѡ�й�", true);
	DG_SetParam("�������", "�����");
	DG_SetParam("��ַ�Χ", 15);
	DG_SetParam("����", "��ֵ", { {x=xpos,y=ypos}});
	DG_SetParam("��ͼ", -1);
	DG_SetParam("�Ƿ񹥻�", true);
	DG_SetParam("��������", { usehorse = false, usepet = true, dxys = false });
	while true do
		DG_OnAction();Sleep(500)
		PickUp();Sleep(500)
		if callback(xpos,ypos) == false then
			break
		end
	end
	return nil
end



for k2,v2 in ipairs(position) do 
	DaGuai(v2[1],v2[2])
	Sleep(2000)
end