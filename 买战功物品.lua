-------购买战功商店 开始----------------------
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

PushDebugMessage("#eDC4C18#cFFFF00 购买战功商店开始")
if CityToGuild() then
    MoveToNPC(94, 54, -1, "赵子勋"); Sleep(1500)
    QuestFrameOptionClicked("战功商店",1); Sleep(1500)
    -- 领取奖励
	for i = 1,5 do
		--购买润物露
		GetLuaValue("setmetatable(_G, {__index=JueweiShop_Env});JueweiShop_BuyItem(9);","",3);
		MessageBox_Self_OK_Clicked()
		Sleep(500)
	end

-- GuildToCity()
end

-------领取大区赛每周奖励 结束----------------------