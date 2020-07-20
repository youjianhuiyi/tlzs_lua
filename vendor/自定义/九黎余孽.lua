function 是否完成(Name)
        
        local i = GetPlayerMission(Name) 
        if i >= 0 then
            if GetLuaValue(string.format("return DataPool:GetPlayerMission_Variable(%d, 0)", i), "n",1) == 1 then 
               return true 
            end 
        end 
 
    return false 
end
PushDebugMessage("本脚本由龙园第一帅:酱油编写,请勿传播.qq695840730.")
while true do
	跨图寻路("崖余岛",202,64);Sleep(1000)
	TalkNpc("栾英博");Sleep(1000)
	QuestFrameOptionClicked("清剿：九黎余孽",1);Sleep(1000)
	QuestFrameAcceptClicked();Sleep(1000)
	local index = GetPlayerMission("清剿：九黎余孽") 
	if index >= 0 then
		break
	end
end
DG_OnInit() 
DG_SetParam("打怪方式", "先绿后红")
DG_SetParam("攻击模式", "优先绿怪")
DG_SetParam("目标","所有")
DG_SetParam("是否选中怪", true)
DG_SetParam("怪物归属", "红白绿")
DG_SetParam("打怪范围", 15)
DG_SetParam("坐标", "赋值", { { x = 167, y = 207 }})
DG_SetParam("地图", 698)
DG_SetParam("是否攻击", true)
DG_SetParam("其他参数", { usehorse = true, usepet = true, dxys = false })
while true do
DG_OnAction()
if 是否完成("清剿：九黎余孽") then
	break
end
end
跨图寻路("崖余岛",202,64);Sleep(1000)
TalkNpc("栾英博");Sleep(1000)
QuestFrameOptionClicked("清剿：九黎余孽",1);Sleep(1000)
QuestFrameNextClicked();Sleep(1000)
QuestFrameMissionComplete();Sleep(1000)