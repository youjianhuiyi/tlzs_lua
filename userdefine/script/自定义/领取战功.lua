--[[
    �ű����ܣ���ȡս��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
LoadScript('LtoGuild.lua')

if CityToGuild() then
    MoveToNPC(94, 54, -1, "����ѫ"); Sleep(1500)
    QuestFrameOptionClicked("��ȡ������ÿ�ܽ���",1); Sleep(1500)
    -- ��ȡ����
    GetLuaValue("setmetatable(_G, {__index=Bhls_Prize_Env});Bhls_Prize_Ok_Clicked();", "", 0); Sleep(1500)
    MoveToNPC(94, 54, -1, "����ѫ"); Sleep(1500)
    QuestFrameOptionClicked("ս���̵�",1); Sleep(1500)
    -- ��ʼ�� ��ȡ�겻Ҫ��������
	--GuildToCity()
end