-------����ս���̵� ��ʼ----------------------
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

PushDebugMessage("#eDC4C18#cFFFF00 ����ս���̵꿪ʼ")
if CityToGuild() then
    MoveToNPC(94, 54, -1, "����ѫ"); Sleep(1500)
    QuestFrameOptionClicked("ս���̵�",1); Sleep(1500)
    -- ��ȡ����
	for i = 1,5 do
		--��������¶
		GetLuaValue("setmetatable(_G, {__index=JueweiShop_Env});JueweiShop_BuyItem(9);","",3);
		MessageBox_Self_OK_Clicked()
		Sleep(500)
	end

-- GuildToCity()
end

-------��ȡ������ÿ�ܽ��� ����----------------------