--[[
    脚本功能：领取战功
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
LoadScript('LtoGuild.lua')

if CityToGuild() then
    MoveToNPC(94, 54, -1, "赵子勋"); Sleep(1500)
    QuestFrameOptionClicked("领取大区赛每周奖励",1); Sleep(1500)
    -- 领取奖励
    GetLuaValue("setmetatable(_G, {__index=Bhls_Prize_Env});Bhls_Prize_Ok_Clicked();", "", 0); Sleep(1500)
    MoveToNPC(94, 54, -1, "赵子勋"); Sleep(1500)
    QuestFrameOptionClicked("战功商店",1); Sleep(1500)
    -- 开始购 领取完不要出帮会城市
	--GuildToCity()
end