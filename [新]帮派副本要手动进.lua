PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ�����ߵ�NPC�����븱��ˢ��");
local activeScene = GetActiveSceneName()
local npcs = {}
AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ
local position = {
	{72,97},
	{51,92},
	{52,86},
	{43,67},
	{46,48},
	{48,54},
	{65,57},
	{141,54},
	{136,100},
	{130,100},
	{99,44},
};
-----------------------------------------------------------
-- ������������������ǰ����û�й����ʱ�����������ˢ��
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name .. "---" .. value.hp);
		if value.class == "����" then
			if value.hp ~= 0 then
				count = count + 1
			end 
		end
	end
	
	while true do 
		PushDebugMessage("��ǰ���������Ϊ��"..count .. "��");Sleep(500)
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



for k1,v1 in ipairs(position) do
	PushDebugMessage("��ǰ�ǵ�"..k1.."�������")
	DaGuai(v1[1],v1[2])
	Sleep(500)
end
PickUp()
Sleep(10000)
PickUp()