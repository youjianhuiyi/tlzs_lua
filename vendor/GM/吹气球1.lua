PushDebugMessage("#cFF0000>>���԰�<<")

PushDebugMessage("#Y��������ʼ");Sleep(1000)
��ͼѰ·("����",261,342)
local ��ǰ��ͼID = GetSceneID()
MoveToNPC(261, 342, -1, "ͯ��");Sleep(1000)
�ȴ���������(6,"��������ʼ,�����������Ͽ���")
��ͼѰ·("����",261,342)
local ��ǰ��ͼID = GetSceneID()
MoveToNPC(261, 342, -1, "ͯ��");Sleep(1000)
QuestFrameOptionClicked("���",0);Sleep(1000)
QuestFrameOptionClicked("���",0);Sleep(1000)


local AID = GetSceneID()
if AID == 0 then
	PushDebugMessage("������������")
else
    PushDebugMessage("����ǰ����������")
    MoveToNPC(262,342,0,"");Sleep(1000)
end
local �ӳ� = IsLeader()
if �ӳ� == 1 then
	local MM = "�������򡤴��"
	if not FindBagItem(-2, MM) then
		PushDebugMessage("#Y������û��[�������򡤴��],������ȡ��");Sleep(1000)
		while true do
		    TalkNpc("ͯ��");Sleep(1000)
			QuestFrameOptionClicked("�����ը����ӣ�",1);Sleep(1000)
			QuestFrameOptionClicked("��ȡ�������򡤴��",0);Sleep(2000)
			local MM = "�������򡤴��"
			if FindBagItem(-2, MM) then
				PushDebugMessage("#Y����ȡ������");Sleep(1000)
				break
			end
		end
		MoveToNPC(231,345,0,"");Sleep(1000)
		������();Sleep(1000)
		while true do
			UseItem(0,"�������򡤴��");Sleep(5000)
			local szText, strType = GetNPCEventList_Text(0)
			if strType == "text" then
				QuestFrameOptionClicked("������ս",1);Sleep(2500)
				while true do
					GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
				end
			end
			PushDebugMessage("#Y�����޷����ã���鿴");Sleep(1000)
		end
	else
		MoveToNPC(231,345,0,"");Sleep(1000)
		������();Sleep(1000)
		while true do
			UseItem(0,"�������򡤴��");Sleep(10000)
			local szText, strType = GetNPCEventList_Text(0)
			if strType == "text" then
				QuestFrameOptionClicked("������ս",1);Sleep(2500)
				while true do
					GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
				end
			end
			PushDebugMessage("#Y�����޷����ã���鿴");Sleep(1000)
		end
	end
else
	MoveToNPC(262,342,0,"");Sleep(15000)
	MoveToNPC(231,345,0,"");Sleep(1000)
	������();Sleep(1000)
	while true do
		GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
	end
end