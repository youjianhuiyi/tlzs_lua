--[[
	�ű����ã���ʱ��֣����ɸ����ֶ�������Զ��ܵ��֣��� BOSS ʱ��Ҫע���ֶ����
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local activeScene = GetActiveSceneName()
AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ

------------------------------------------------------
--- ˢ�ֵ�����㣬��˳���������ˢ
------------------------------------------------------
local position = {
	{72,97},
	{51,92},
	{58,92},
	{43,67},
	{46,48},
	{48,54},
	{65,57},
	{141,54},
	{136,100},
	{130,100},
	{99,44},
};

------------------------------------------------------
-- �����ֽű�
------------------------------------------------------
function DaGuai(xpos,ypos)
	Player_TeamFollow(false)
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

-----------------------------------------------------------
-- ������������������ǰ����û�й����ʱ�����������ˢ��
-- xpos x ����
-- ypos y ����
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage("#eDC4C18#cFFFF00"..key .. " #81#81 " .. value.name .. " #81#81 " .. value.hp);
		if value.class == "����" then
			if value.hp ~= 0 then
				count = count + 1
			end 
		end
	end
	
	while true do 
		PushDebugMessage("#eDC4C18#cFFFF00 #81 ��ǰ���������Ϊ��"..count .. "�� #81");Sleep(500)
		if count == 0 then
			return false
		else
			return true
		end
	end
end


------------------------------------------------------
-- ���ĵ���
------------------------------------------------------
for k2,v2 in ipairs(position) do
	Player_TeamFollow(false)
	DaGuai(v2[1],v2[2])
	Sleep(2000)
end