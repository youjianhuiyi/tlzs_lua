--�����Ա��������
local strTeam = Team:GetAllName()
MessageBox(strTeam)

--�������г�Ա��Ϣ �������Լ�
local tObj = Team:GetAllMemberInfo()
for i = 1, #tObj do
    local tmp = tObj[i]
    local strMsg = string.format(" id:%d\r\n ���ƣ�%s\r\n x:%d\r\n y:%d\r\n Ѫ��%d\r\n ���룺%d\r\n ��ͼid��%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end

--ȡ����������  ��ǰʣ��Ѫ��ߵĶ�Ա
-- ����1�����ڵ�ͼ
local strName = Team:GetCurrentHPMostMember(GetActiveSceneName())

--ȡ����������  Ѫ������ߵĶ�Ա
local strName = Team:GetHPMostMember(GetActiveSceneName())

--��ȡ�ӳ���Ϣ
local bTrue, tmp = Team:GetLeaderInfo()
if bTrue then
    local strMsg = string.format(" id:%d\r\n ���ƣ�%s\r\n x:%d\r\n y:%d\r\n Ѫ��%d\r\n ���룺%d\r\n ��ͼid��%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end

--ȡ��������
local nCount = Team:GetMemberCount()

--ȡ����ָ��������ҵ���Ϣ
local tmp = Team:GetMemberInfoByName("�����")
if tmp.id then
    local strMsg = string.format(" id:%d\r\n ���ƣ�%s\r\n x:%d\r\n y:%d\r\n Ѫ��%d\r\n ���룺%d\r\n ��ͼid��%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end
-- ��ȡ�����ڶ����е������� �±��0��ʼ
local nIndex = Team:GetMyIndex()

--ȡ��Χ�Ķ����Ա,�����Լ�
--	����ֵ1��������		��Χ�����Ա����
--	����ֵ2����Ա����   
--	����1����Χ�ķ�Χ����
local nCount,tObj = Team:GetSurroundMember(9)

--�����Ƿ���������
local bDie, strName = Team:IsHaveDieMember()
if bDie then 
	MessageBox(strName .. ":�Ѿ�����")
end

--�����Ա�����Ƿ����� �����߼���
local bTrue = Team:IsCountReady(6)

--�����Ƿ���ָ������
local bHave = Team:IsHaveMenpai("��ɽ")

--��Ա�Ƿ���ͬ һ����ͼ
local bTrue = Team:IsInSameScene()

Team:CreateTeam()
Team:InviteNear()

--ָ����ͼ�Ƿ�������
--	����ֵ1���߼���		
--	����ֵ2��������		Ѫֵ   
--����1����ͼ���ƣ�Ĭ�ϵ�ǰ��ͼ
--����2������id
local bHave, HPValue = Team:IsSceneHaveFammily("", 4)

--�˳�����
Team:LeaveTeam()

--����û�ж����Աʱ�˳�����
Team:LeaveCheckNear()

--ͬ�⸽�����������������
Team:AgreeNearInvite()
Team:AgreeNearInvite_2()

--�ӳ���ͬ�⸽����ҵ���������
Team:AgreeNearJoin()

