------- ��ʼ----------------------------------
������Ļ�ı�("#eDC4C18#cFFFF00��ʼ�Զ�ɨ�����")
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
	--����1����ȡ������Ʒ���� ���ո�ֿ�
	--����2��ȡ��������
	--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
	--����4�������� true �� false �ɿ�
	--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
local nCnt = Bank_GetItem(" ���з��� ", 31, 1)
-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
if MapName == "����" then
	MoveToNPC(219,245,0,"������");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(200,334,1,"���»�");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(206,56,2,"�����");Sleep(1000)
elseif MapName == "¥��" then
	MoveToNPC(163,153,246,"���");Sleep(1000)
else
	ִ�нű�("[����] �س�")
	MoveToNPC(219,245,0,"������");Sleep(1000)
end
QuestFrameOptionClicked("��ս��ջþ�",1); Sleep(1000)
for i = 0, 50 do
    GetLuaValue("setmetatable(_G, {__index = DanrenFB_Env});DanrenFB_SaoDang_Clicked();","",0)
	Sleep(500)
	PushDebugMessage("#eDC4C18#cFFFF00�Զ�ɨ����ս���")
end
ִ�нű�("�����")