local szMisson = {"��ս���ɱ��", "��ս���������", "��ս�����翷�", "��ս����ľ�ׯ"}

--�����npc
local npc = {x = 205, y = 54, sceneID = 2, name = "�����"}

for i = 1, 4 do

    local nIndex, idMission, idScript = GetPlayerMissionEx(szMisson[i])

	if nIndex ~= -1 then
		
		if IsMissionCanCommit(nIndex) == 1 then
			
			MoveToNPC(npc.x, npc.y, npc.sceneID, npc.name)
			
			Sleep(600)

			PushDebugMessage("��������� <%s>", szMisson[i])
			
			if QuestFrameOptionClicked(szMisson[i], 1) then
				
				Sleep(1500)
				
				QuestFrameMissionComplete()
				
				Sleep(1000)
				
			end
			
		else
			
			DebugMessage("û����ɵ��������")
			
		end
		
	end
	
end
