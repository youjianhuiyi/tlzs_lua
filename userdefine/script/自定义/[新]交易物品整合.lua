--[[
    �ű����ܣ��ϰ�Ž��ս�����Ʒ���������ú��ϰ��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local items = " �������� �޲���Ƭ ������Ƭ �߼�ҩ�� ���޵� �м�ҩ�� ׺��ʯ��Ԫ ׺��ʯ���� ׺��ʯ���� ������ ������ ����ˮ ����Ѫ�� ����Ȫ ���齬 ";
LoadScript("allPlayers.lua")

function main()
	-- ��һ��,�����ٱ�������ı�����
	LoadScript("[��]��ָ����Ʒ")
	-- �ڶ�������ȡ��������������������Ҫȡ������Ʒ
	LoadScript("����ȡ��")
	-- ����������ȡ��������Ʒ���һ��
	LoadScript("[����] ��Ʒ���")
	-- ���Ĳ�����ȡ��������Ʒ���һ��
	LoadScript("�ӹ�����")
	local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
	--����1����ȡ������Ʒ���� ���ո�ֿ�
	--����2��ȡ��������
	--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
	--����4�������� true �� false �ɿ�
	--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
	local nCnt = Bank_GetItem(items, 31, 1, true)
	for i = 1 , 4 do
		LoadScript("���׸��ϰ��");Sleep(100);
	end
end
-- ִ������
main()
-- ���֮��ִ����������
MoveToNPC(343,246,1,"�����");Sleep(1000)