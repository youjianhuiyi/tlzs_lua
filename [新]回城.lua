-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
local flag = true

function goGuild()
	if MapName == "����" or MapName == "����" or MapName == "����" or MapName == "¥��" then
		��ͼѰ·("����",347,249)
		flag = false
	else
		ȡ������()
		������()
		local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
		if bUse then
			��ͼѰ·("����",347,249)
		end
		flag = false
	end
end

ȡ������()
while flag do
 goGuild()
end
ִ�нű�("[����] ��������");Sleep(2000)
ִ�нű�("[����] ��Ʒ���");Sleep(1000)
ִ�нű�("�ӹ�����")