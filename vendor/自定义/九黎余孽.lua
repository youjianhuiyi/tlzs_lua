function �Ƿ����(Name)
        
        local i = GetPlayerMission(Name) 
        if i >= 0 then
            if GetLuaValue(string.format("return DataPool:GetPlayerMission_Variable(%d, 0)", i), "n",1) == 1 then 
               return true 
            end 
        end 
 
    return false 
end
PushDebugMessage("���ű�����԰��һ˧:���ͱ�д,���𴫲�.qq695840730.")
while true do
	��ͼѰ·("���ൺ",202,64);Sleep(1000)
	TalkNpc("��Ӣ��");Sleep(1000)
	QuestFrameOptionClicked("��ˣ���������",1);Sleep(1000)
	QuestFrameAcceptClicked();Sleep(1000)
	local index = GetPlayerMission("��ˣ���������") 
	if index >= 0 then
		break
	end
end
DG_OnInit() 
DG_SetParam("��ַ�ʽ", "���̺��")
DG_SetParam("����ģʽ", "�����̹�")
DG_SetParam("Ŀ��","����")
DG_SetParam("�Ƿ�ѡ�й�", true)
DG_SetParam("�������", "�����")
DG_SetParam("��ַ�Χ", 15)
DG_SetParam("����", "��ֵ", { { x = 167, y = 207 }})
DG_SetParam("��ͼ", 698)
DG_SetParam("�Ƿ񹥻�", true)
DG_SetParam("��������", { usehorse = true, usepet = true, dxys = false })
while true do
DG_OnAction()
if �Ƿ����("��ˣ���������") then
	break
end
end
��ͼѰ·("���ൺ",202,64);Sleep(1000)
TalkNpc("��Ӣ��");Sleep(1000)
QuestFrameOptionClicked("��ˣ���������",1);Sleep(1000)
QuestFrameNextClicked();Sleep(1000)
QuestFrameMissionComplete();Sleep(1000)