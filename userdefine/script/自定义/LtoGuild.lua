--[[
	�ű����ã�ͨ�ý����ɷ�������ȡ����
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


local MapName = GetActiveSceneName()
local flag = true

---------------------------------------------------------------------
-- ȥǮׯ�һ�Ԫ��Ʊ
---------------------------------------------------------------------
function goGuildNPC()
	if MapName == "����" then
		MoveToNPC(237,236,0,"������");Sleep(1000)
		flag = false
	elseif MapName == "����" then
		MoveToNPC(322,264,1,"������");Sleep(1000)
		flag = false
	elseif MapName == "����" then
		MoveToNPC(179,121,2,"������");Sleep(1000)
		flag = false
	elseif MapName == "¥��" then
		MoveToNPC(191,130,246,"�����v");Sleep(1000)
		flag = false
	else
		Player_TeamFollow(false)
		Dismount()
		local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
		if bUse == false then
			��ͼѰ·("����",347,249)
		end
		MoveToNPC(237,236,0,"������");Sleep(1000)
		flag = false
	end
end

goGuildNPC();