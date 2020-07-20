local szMisson = {"挑战虚空杀星", "挑战虚空燕子坞", "挑战虚空缥缈峰", "挑战虚空四绝庄"}

--大理的npc
local npc = {x = 205, y = 54, sceneID = 2, name = "金忆风"}

for i = 1, 4 do

    local nIndex, idMission, idScript = GetPlayerMissionEx(szMisson[i])

	if nIndex ~= -1 then
		
		if IsMissionCanCommit(nIndex) == 1 then
			
			MoveToNPC(npc.x, npc.y, npc.sceneID, npc.name)
			
			Sleep(600)

			PushDebugMessage("交虚空任务 <%s>", szMisson[i])
			
			if QuestFrameOptionClicked(szMisson[i], 1) then
				
				Sleep(1500)
				
				QuestFrameMissionComplete()
				
				Sleep(1000)
				
			end
			
		else
			
			DebugMessage("没有完成的虚空任务")
			
		end
		
	end
	
end
