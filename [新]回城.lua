-----��ʼ----------------------
local MapName = GetActiveSceneName()
local LocationItems = {"��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��"}
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
local Jiaozi = GetMoney(2)

function backCity()
	if MapName == "����" or MapName == "����" or MapName == "����" or MapName == "¥��" then
		��ͼѰ·("����",340,210)
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
					--ʹ�õ�������Ʒ
					--	����ֵ��2��(�߼��� ������) �Ƿ�ʹ�� λ������
					--  ����1���ı���		��Ʒ���ƣ�֧�ֶ����Ʒ���ո����
					--  ����2��������		0����ν 1����� 2�󶨵�
					local bUse, nIndex = Bag:UseBagItem_DJ(tmp.name, 0)
					Sleep(10000)
					if bUse then
						return true
					end
				end
			end			
		end
		local bUse = Skill:UseSkillByName("���ش����", -1, 10000)
		if bUse then
			��ͼѰ·("����",340,210)
		end
	end
end

-- ��ⱳ������û�н��ӵ�ʱ��ȡ��ҽ�������������
function CoinToJiaozi()
	--�ֿ�ȡǮ������2�ɿ�
	Bank_GetMoney(50000)
end

-- ���ĵ���
backCity()

if Jiaozi / 10000 <= 2 then
	CoinToJiaozi()
end

--��ȡ������Ʒ����
--	����ֵ��������
--  ����1���ı���		��Ʒ���ƣ�ֻ֧�־�ȷ����
--  ����2��������		��״̬ 0����ν 1����� 2�󶨵�
--  ����3��������		����״̬ 0����ν 1������ 2������
local nCount = Bag:GetItemCount("���������", 0, 1)

if nCount <= 60 then
	ִ�нű�("[����] ��������");Sleep(2000)
end

ִ�нű�("[����] ��Ʒ���");Sleep(1000)
ִ�нű�("�ӹ�����")