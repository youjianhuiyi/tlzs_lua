--MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
local items = " ���캮�� ";
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
--����1����ȡ������Ʒ���� ���ո�ֿ�
--����2��ȡ��������
--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
--����4�������� true �� false �ɿ�
--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
local nCnt = Bank_GetItem(items,1000,1,true)

--[[
    �ű����ܣ����캮��ϳ�
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]

-----------------------------------------------------------
-- �������Ƿ��� NPC
-----------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ʷɩ" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(187,225,246,"ʷɩ");Sleep(1000)
			QuestFrameOptionClicked("����ϳ�", 1, 500)
			return true
		end
	end
end




-----------------------------------------------------------
-- ���ĵ���
-----------------------------------------------------------
checkNPCDst()

while true do
	QuestFrameOptionClicked("��Ҫ�ϳ�", 1, 500)
	Sleep(100)
	--��ȡ������Ʒ����
	--	����ֵ��������
	--  ����1���ı���		��Ʒ���ƣ�ֻ֧�־�ȷ����
	--  ����2��������		��״̬ 0����ν 1����� 2�󶨵�
	--  ����3��������		����״̬ 0����ν 1������ 2������
	local nCount = Bag:GetItemCount("���캮��", 1, 1)
	GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(80);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);","",0);Sleep(80);
	GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();","",0);Sleep(80);--������
	if nCount < 5 then
		PushDebugMessage("#b#eff00ff�������캮����5���������ϳɣ�")
		break
	end
end