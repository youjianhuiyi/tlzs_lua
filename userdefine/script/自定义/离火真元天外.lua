--[[
    �ű����ܣ�ȡ�������Ԫ���������Ʒ��������Ϸ��ɫ�Ĵ��졣�����ճ�����ֿⱳ�������󶨵���Ʒʹ����
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
local nCnt = Bank_GetItem(" ��� ����ʯ ����ʯ��Ƭ �������� ����Ȫ ������ ������ ׺��ʯ��Ԫ ׺��ʯ���� ׺��ʯ���� �������� ����Ѫ�� ��΢���� ���˿ ", 31,0)

---------------------------------------------------------------------
-- �������Ƿ��� NPC
---------------------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "��ʿ��" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(350,229,1,"��ʿ��");Sleep(500)
			QuestFrameOptionClicked("��Ԫ",1); Sleep(500)
			return true
		end
	end
end

---------------------------------------------------------------------
-- �������Ƿ��� NPC
---------------------------------------------------------------------
checkNPCDst();