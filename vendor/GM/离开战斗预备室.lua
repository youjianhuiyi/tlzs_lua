PushDebugMessage("----------���ű���QQ1026818119��д----------")

function �жϱ�ս��()
local x����,y���� = Player_GetPos()
if x���� <= 72 and y���� <= 72 then return "��ս��һ"
elseif x���� >= 96 and x���� <= 168 and y���� <= 72 then return "��ս�Ҷ�"
elseif x���� >= 182 and y���� <= 72 then return "��ս����"
elseif x���� <= 72 and y���� >= 94 and y���� <= 168 then return "��ս����"
elseif x���� >= 96 and x���� <= 168 and y���� >= 94 and y���� <= 168 then return "��ս����"
elseif x���� >= 182 and y���� >= 94 and y���� <= 168 then return "��ս����"
elseif x���� <= 72 and y���� >= 185 then return "��ս����"
elseif x���� >= 96 and x���� <= 168 and y���� >= 185 then return "��ս�Ұ�"
elseif x���� >= 182 and y���� >= 185 then return "��ս�Ҿ�"
end
end

function �뿪Ԥ����(x)
if GetActiveSceneName() == "��ʦս��Ԥ����" or GetActiveSceneName() == "����ս��Ԥ����" or GetActiveSceneName() == "��ʿս��Ԥ����" then 
	if �жϱ�ս��() == "��ս��һ" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(37, 13, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս�Ҷ�" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(133, 13, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս����" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(219, 13, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս����" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(37, 106, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս����" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(133, 106, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս����" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(219, 106, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս����" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(37, 196, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս�Ұ�" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(133, 196, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif �жϱ�ս��() == "��ս�Ҿ�" then
	while true do
	if GetActiveSceneName() ~= "��ʦս��Ԥ����" and GetActiveSceneName() ~= "����ս��Ԥ����" and GetActiveSceneName() ~= "��ʿս��Ԥ����" then break end
	MoveToNPC(219, 196, -1, "��ָ̨��ʹ"); Sleep(1000)
	QuestFrameOptionClicked("�뿪ս��Ԥ����",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	end
end
end

�뿪Ԥ����("����")
PushDebugMessage("�Ѿ�����ս��Ԥ���ң�������")





