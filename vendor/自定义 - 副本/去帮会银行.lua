-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
if MapName == "����" then
	MoveToNPC(237,236,0,"������");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(322,264,1,"������");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(179,121,2,"������");Sleep(1000)
elseif MapName == "¥��" then
	MoveToNPC(191,130,246,"�����v");Sleep(1000)
else
	ִ�нű�("[����] �س�")
	MoveToNPC(237,236,0,"������");Sleep(1000)
end

QuestFrameOptionClicked("���뱾�����");Sleep(3000)
������Ļ�ı�("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")
if CityToGuild() then
    MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
    QuestFrameOptionClicked("�������",1); Sleep(3000)
-- GuildToCity()����Ҫ�ֶ���������ʱ����
end
-----����----------------------
