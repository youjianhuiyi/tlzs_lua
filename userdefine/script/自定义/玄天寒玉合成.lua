--MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
local items = " ���캮�� ";
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
--����1����ȡ������Ʒ���� ���ո�ֿ�
--����2��ȡ��������
--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
--����4�������� true �� false �ɿ�
--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
local nCnt = Bank_GetItem(items,1000,1,true)
MoveToNPC(187,225,246,"ʷɩ", nil, true)
Sleep(600)
QuestFrameOptionClicked("����ϳ�", 1, 500)
Sleep(600)


--���ĵ��ã�
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ʷɩ" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(187,225,246,"ʷɩ");Sleep(1000)
				QuestFrameOptionClicked("����ϳ�", 1, 500)
			end
			return true
		end
	end
end

checkNPCDst()

while true do
	QuestFrameOptionClicked("��Ҫ�ϳ�", 1, 500)
	Sleep(100)
	--��ȡ������Ʒ����
	--	����ֵ��������
	--  ����1���ı���		��Ʒ���ƣ�ֻ֧�־�ȷ����
	--  ����2��������		��״̬ 0����ν 1����� 2�󶨵�
	--  ����3��������		����״̬ 0����ν 1������ 2������
	local nCount = Bag:GetItemCount("���캮��", 1, 1)
	Packet_PackUp_Clicked();--������
	if nCount < 5 then
		PushDebugMessage("#b#eff00ff�������캮����5���������ϳɣ�")
		break
	end
end