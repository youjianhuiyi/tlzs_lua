--GetLuaValue() ����Ǹ����ܽӿڣ���ʵ�ֺܶ๦�ܣ������õĻ����ע�������ű�.lua���м�����
--local ����ֵ1,����ֵ2,����ֵn = GetLuaValue("��Ϸ��lua�ִ�","����ֵ����",����ֵ����)    
 --   ���� "s"  �ı���
 --   ���� "n"  ������
 --   "sns" ��ʾ3������ֵ����һ���ı��ͣ��ڶ��������ͣ��������ı��͡���Ӧ����ֵ������3
-----��ʼ----------------------
PushDebugMessage("��ʼ����ˢ��ǰ������׼��������һ�����⿪ʼˢ��")
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
if MapName == "����" then
	MoveToNPC(275, 295, 0,"������");Sleep(500)
elseif MapName == "����" then
	MoveToNPC(171,238,1,"������");Sleep(500)
elseif MapName == "����" then
	MoveToNPC(271,133,2,"��ƮƮ");Sleep(500)
elseif MapName == "¥��" then
	MoveToNPC(109,121,246,"������");Sleep(500)
else
	ִ�нű�("[����] �س�")
	MoveToNPC(275, 295, 0,"������");Sleep(500)
end
QuestFrameOptionClicked("����������Ʒ",1); Sleep(500)
--��������
GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);
Sleep(500);
--�������
GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(4);","",0);
Sleep(500);
--�����ֵ 
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);
Sleep(500);
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);
Sleep(200)
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);
Sleep(500);
PushDebugMessage("���������׼����ˢ")