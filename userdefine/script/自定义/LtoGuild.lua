--[[
	�ű����ã�ͨ�ý����ɷ�������ȡ����
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


local MapName = GetActiveSceneName()
local LocationItems = {"��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��"}

---------------------------------------------------------------------
-- ȥ����
---------------------------------------------------------------------
function goGuildNPC()
	--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
	Player_TeamFollow(false)
	if MapName == "����" then
		MoveToNPC(237,236,0,"������");Sleep(1000)
	elseif MapName == "����" then
		MoveToNPC(322,264,1,"������");Sleep(1000)
	elseif MapName == "����" then
		MoveToNPC(179,121,2,"������");Sleep(1000)
	elseif MapName == "¥��" then
		MoveToNPC(191,130,246,"�����v");Sleep(1000)
	else
		--������
		Dismount()
		for key,value in ipairs(LocationItems) do
			--����������������������Ʒ
			--����ֵ����Ʒ����
			local tObj = Bag:EnumAllObj()
			for i = 1, #tObj do
				local tmp = tObj[i]
				if tmp.name == value and tmp.count >= 1 then 
					local nIndex = tmp.index
					local locationName = tmp.name
					--ʹ�õ�������Ʒ
					--	����ֵ��2��(�߼��� ������) �Ƿ�ʹ�� λ������
					--  ����1���ı���		��Ʒ���ƣ�֧�ֶ����Ʒ���ո����
					--  ����2��������		0����ν 1����� 2�󶨵�
					local bUse, nIndex = Bag:UseBagItem_DJ(tmp.name, 0)
					Sleep(1000)
					if bUse then 
						break
					end
				else 
					local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
					if bUse then
						MoveToNPC(340,210,1,"����")
					end
				end
			end
		end
		
		MoveToNPC(322,264,1,"������");Sleep(1000)
	end

end