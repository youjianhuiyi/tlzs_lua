local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
local nCnt = Bank_GetItem(" ����ľ� ��ľ�ʯ ����Һ ", 31,0)
MoveToNPC(236,236,0,"������");Sleep(1500)
QuestFrameOptionClicked("���뱾�����");Sleep(3000)
PushDebugMessage("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")
if CityToGuild() then
    MoveToNPC(44, 47, -1, "������"); Sleep(1500)
    QuestFrameOptionClicked("���������������",1); Sleep(3000)
-- GuildToCity()����Ҫ�ֶ���������ʱ����
end