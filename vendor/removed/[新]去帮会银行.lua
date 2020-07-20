-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
if MapName == "洛阳" then
	MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
elseif MapName == "苏州" then
	MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
elseif MapName == "大理" then
	MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
elseif MapName == "楼兰" then
	MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
else
	执行脚本("[功能] 回城")
	MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
end

QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
输入屏幕文本("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")
if CityToGuild() then
    MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
    QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
-- GuildToCity()这里要手动操作，暂时不离帮。
end
-----结束----------------------
