--[[
    �ű����ܣ�ֱ�ӳ嵽�������ȥ
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

LoadScript("LtoGuild.lua")
QuestFrameOptionClicked("���뱾�����");Sleep(3000)
PushDebugMessage("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")
-----------------------------------------------------------
-- �������Ƿ��� NPC
-----------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ǮΪһ" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
			QuestFrameOptionClicked("�������",1); Sleep(3000)
			return true
		end
	end
end


-----------------------------------------------------------
-- ���ĵ���
-----------------------------------------------------------
if CityToGuild() then
   checkNPCDst()
end