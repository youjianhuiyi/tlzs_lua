-----��ʼ----------------------
local MapName = GetActiveSceneName()
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
local flag = true
local Jiaozi = GetMoney(2)

function backCity()
	if MapName == "����" or MapName == "����" or MapName == "����" or MapName == "¥��" then
		��ͼѰ·("����",340,210)
		flag = false
	else
		ȡ������()
		--������
		Dismount()
		--���ҵ�������Ʒ
		--	����ֵ��2��(�߼��� ������) �Ƿ��ҵ� λ������
		--  ����1���ı��� 		��Ʒ���ƣ�ֻ֧�־�ȷ����
		--  ����2�������� 		��״̬ 0����ν 1����� 2�󶨵�
		local bFind, nIndex = Bag:FindBagItem_DJ("��ɫ��λ��", 0)
		if bFind then
			while true do
				--ʹ�õ�������Ʒ
				--	����ֵ��2��(�߼��� ������) �Ƿ�ʹ�� λ������
				--  ����1���ı���		��Ʒ���ƣ�֧�ֶ����Ʒ���ո����
				--  ����2��������		0����ν 1����� 2�󶨵�
				local bUse, nIndex = Bag:UseBagItem_DJ("��ɫ��λ��", 0)
				Sleep(1000)
				if bUse then 
					return true
				end
			end
		else 
			local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
			if bUse then
				��ͼѰ·("����",340,210)
			end
			flag = false
		end
	end
end

-- ��ⱳ������û�н��ӵ�ʱ��ȡ��ҽ�������������
function CoinToJiaozi()
	--�ֿ�ȡǮ������2�ɿ�
	Bank_GetMoney(50000)
	-- if MapName == "����" then
		-- MoveToNPC(347,248,0,"������");Sleep(50)
	-- elseif MapName == "����" then
		-- MoveToNPC(343,246,1,"�����");Sleep(50)
	-- elseif MapName == "����" then 
		-- MoveToNPC(213,179,2,"�����");Sleep(50)
	-- elseif MapName == "¥��" then
		-- MoveToNPC(219,122,246,"�ӻ��");Sleep(50)
	-- else 
		-- MoveToNPC(343,246,1,"�����");Sleep(50)
	end
end

-- ���ĵ���
while flag do
 backCity()
end
if Jiaozi / 10000 <= 2 then
	CoinToJiaozi()
end
ִ�нű�("[����] ��������");Sleep(2000)
ִ�нű�("[����] ��Ʒ���");Sleep(1000)
ִ�нű�("�ӹ�����")