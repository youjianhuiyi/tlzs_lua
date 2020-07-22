--[[
    脚本功能：令牌装备升级
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 翡翠心精 天荒晶石 唤灵液 ", 31,0)


LoadScript(LtoGuild.lua);

PushDebugMessage("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")
if CityToGuild() then
    MoveToNPC(44, 47, -1, "孔相如"); Sleep(1500)
    QuestFrameOptionClicked("四象宝珠打造与升级",1); Sleep(3000)
-- GuildToCity()这里要手动操作，暂时不离帮。
end