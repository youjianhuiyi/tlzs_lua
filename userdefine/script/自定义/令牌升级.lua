--[[
    �ű����ܣ�����װ������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
local nCnt = Bank_GetItem(" ����ľ� ��ľ�ʯ ����Һ ", 31,0)


LoadScript(LtoGuild.lua);

PushDebugMessage("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")
if CityToGuild() then
    MoveToNPC(44, 47, -1, "������"); Sleep(1500)
    QuestFrameOptionClicked("���������������",1); Sleep(3000)
-- GuildToCity()����Ҫ�ֶ���������ʱ����
end