local MapName = GetActiveSceneName()
local LocationItems = {"��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��"}
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
ȡ������()
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
					��ͼѰ·("����",340,210)
				end
			end
		end
	end
	
	MoveToNPC(322,264,1,"������");Sleep(1000)
end

QuestFrameOptionClicked("���뱾�����");Sleep(3000)
������Ļ�ı�("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")

--���ĵ��ã�
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

if CityToGuild() then
   checkNPCDst()
end