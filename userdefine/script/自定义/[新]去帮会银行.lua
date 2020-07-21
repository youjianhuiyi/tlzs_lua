LoadScript("LtoGuild.lua")
QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
PushDebugMessage("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")

--核心调用，
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "钱为一" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
			QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
			return true
		end
	end
end

if CityToGuild() then
   checkNPCDst()
end