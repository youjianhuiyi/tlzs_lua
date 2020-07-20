PushDebugMessage("#cFF0000>>测试版<<")

PushDebugMessage("#Y吹气球活动开始");Sleep(1000)
跨图寻路("洛阳",261,342)
local 当前地图ID = GetSceneID()
MoveToNPC(261, 342, -1, "童姥");Sleep(1000)
等待队伍人数(6,"吹气球活动开始,请大家洛阳集合咯！")
跨图寻路("洛阳",261,342)
local 当前地图ID = GetSceneID()
MoveToNPC(261, 342, -1, "童姥");Sleep(1000)
QuestFrameOptionClicked("组队",0);Sleep(1000)
QuestFrameOptionClicked("大号",0);Sleep(1000)


local AID = GetSceneID()
if AID == 0 then
	PushDebugMessage("已在洛阳场景")
else
    PushDebugMessage("正在前往洛阳场景")
    MoveToNPC(262,342,0,"");Sleep(1000)
end
local 队长 = IsLeader()
if 队长 == 1 then
	local MM = "爆破气球·大号"
	if not FindBagItem(-2, MM) then
		PushDebugMessage("#Y背包中没有[爆破气球·大号],请先领取！");Sleep(1000)
		while true do
		    TalkNpc("童姥");Sleep(1000)
			QuestFrameOptionClicked("气球大爆炸（组队）",1);Sleep(1000)
			QuestFrameOptionClicked("领取爆破气球·大号",0);Sleep(2000)
			local MM = "爆破气球·大号"
			if FindBagItem(-2, MM) then
				PushDebugMessage("#Y已领取到气球！");Sleep(1000)
				break
			end
		end
		MoveToNPC(231,345,0,"");Sleep(1000)
		下坐骑();Sleep(1000)
		while true do
			UseItem(0,"爆破气球·大号");Sleep(5000)
			local szText, strType = GetNPCEventList_Text(0)
			if strType == "text" then
				QuestFrameOptionClicked("开启挑战",1);Sleep(2500)
				while true do
					GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
				end
			end
			PushDebugMessage("#Y气球无法放置，请查看");Sleep(1000)
		end
	else
		MoveToNPC(231,345,0,"");Sleep(1000)
		下坐骑();Sleep(1000)
		while true do
			UseItem(0,"爆破气球·大号");Sleep(10000)
			local szText, strType = GetNPCEventList_Text(0)
			if strType == "text" then
				QuestFrameOptionClicked("开启挑战",1);Sleep(2500)
				while true do
					GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
				end
			end
			PushDebugMessage("#Y气球无法放置，请查看");Sleep(1000)
		end
	end
else
	MoveToNPC(262,342,0,"");Sleep(15000)
	MoveToNPC(231,345,0,"");Sleep(1000)
	下坐骑();Sleep(1000)
	while true do
		GetLuaValue("setmetatable(_G, {__index = HappyETJ_HD1_Env});HappyETJ_HD1_Drum_Clicked();", "", 0); Sleep(100)
	end
end