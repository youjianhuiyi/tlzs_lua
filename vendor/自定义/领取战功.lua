-------��ȡ������ÿ�ܽ��� ��ʼ----------------------
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

if CityToGuild() then
    MoveToNPC(94, 54, -1, "����ѫ"); Sleep(1500)
    QuestFrameOptionClicked("��ȡ������ÿ�ܽ���",1); Sleep(1500)
    -- ��ȡ����
    GetLuaValue("setmetatable(_G, {__index=Bhls_Prize_Env});Bhls_Prize_Ok_Clicked();", "", 0); Sleep(1500)
    MoveToNPC(94, 54, -1, "����ѫ"); Sleep(1500)
    QuestFrameOptionClicked("ս���̵�",1); Sleep(1500)
    -- ��ʼ��
GuildToCity()
end