--������
Dismount()
Sleep(1000)
while true do
	--ʹ�õ�������Ʒ
	--	����ֵ��2��(�߼��� ������) �Ƿ�ʹ�� λ������
	--  ����1���ı���		��Ʒ���ƣ�֧�ֶ����Ʒ���ո����
	--  ����2��������		0����ν 1����� 2�󶨵�
	local bUse, nIndex = Bag:UseBagItem_DJ("��ɫ��λ��", 0)
	Sleep(1000)
	if bUse then 
		break
	end
end