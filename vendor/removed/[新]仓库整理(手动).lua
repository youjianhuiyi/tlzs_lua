-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
local flag = true

function goGuild()
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
		ȡ������()
		������()
		local bUse = Skill:UseSkillByName("���ش����", -1, 400)
		if(bUse) then
			��ͼѰ·("����",347,249)
		end
		flag = false
	end
end

while (flag) do
 goGuild()
end

ִ�нű�("[��]��ͼר�����")
--�ֿ⵽��������|���� �������� ��ľ�� ����10�� ���� ��Ѫ��ʯ �ʺ�֮�� ����ͼ ������� �Ź��� ˿��3�� Ⱦ��3�� �߼���Ƭ �޲���Ƭ ������ ������ ϡ���䱦ͼ ������Ƭ ������Ƭ ���캮�� �ͼ���ʯ�ϳɷ� ��ʯ������3�� ����ʯ �嶾�顤Ԫ�� �嶾�顤���� �嶾�顤���� �̾�ʯ(1��) ����ʯ(1��) �ƾ�ʯ(1��) �쾧ʯ(1��) è��ʯ(1��) ����ʯ(1��) ʯ��ʯ(1��) �¹�ʯ(1��) �⾧ʯ(1��) ��ĸ��(1��) ��ʯ(1��) ����(1��) ����(1��) ����(1��) �ʯ(1��) �Ʊ�ʯ(1��) ����ʯ(1��) �̱�ʯ(1��) �ڱ�ʯ(1��) �챦ʯ(1��) ׺��ʯ��Ԫ ׺��ʯ���� ׺��ʯ���� ������ ������ ����ˮ ����Ѫ�� ����Ȫ 
local strItem = AI_GetParameter_User("�ֿ⵽��������") 

--ǰ��ӿո�
strItem = " " .. strItem .. " " 

PushDebugMessage("ȡ����Ʒ��" .. strItem)

--����1����ȡ������Ʒ���� ���ո�ֿ�
--����2��ȡ��������
--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
--����4�������� true �� false �ɿ�
--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
Bank_GetItem(strItem, -1, -1)

PushDebugMessage("ֱ��ȥ���������")
QuestFrameOptionClicked("���뱾�����");Sleep(3000)
������Ļ�ı�("#eDC4C18#cFFFF00��Ҫ�ֶ����������������ֻ�Ƿ�������Ҳ�����ʡȥȡ��Ʒ���͵��鷳����")
if CityToGuild() then
    MoveToNPC(148, 56, -1, "ǮΪһ"); Sleep(1500)
    QuestFrameOptionClicked("�������",1); Sleep(3000)
end
-----����----------------------