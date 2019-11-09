local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 翡翠心精 天荒晶石 唤灵液 ", 31,0)
MoveToNPC(236,236,0,"范纯仁");Sleep(1500)
QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
PushDebugMessage("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")
if CityToGuild() then
    MoveToNPC(44, 47, -1, "孔相如"); Sleep(1500)
    QuestFrameOptionClicked("四象宝珠打造与升级",1); Sleep(3000)
-- GuildToCity()这里要手动操作，暂时不离帮。
end