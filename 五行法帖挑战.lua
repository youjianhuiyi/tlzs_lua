------- ��ʼ----------------------------------
������Ļ�ı�("#eDC4C18#cFFFF00��ʼ�Զ�ɨ�����")

--local g_szItemName = AI_GetParameter("�ֿ�ȡ��")

--Bank_GetItem(g_szItemName,-1)

--local nCnt = Bank_GetItem(" ���з��� ", 500,0)
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
	�ȴ�(50)
	������Ļ�ı�("#eDC4C18#cFFFF00�Զ�ɨ����ս���")
end
ִ�нű�("�����")