local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
local nCnt = Bank_GetItem(" ��� ����ʯ ����ʯ��Ƭ �������� ����Ȫ ������ ������ ׺��ʯ��Ԫ ׺��ʯ���� ׺��ʯ���� �������� ����Ѫ�� ��΢���� ���˿ ", 31,0)


function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "��ʿ��" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(350,229,1,"��ʿ��");Sleep(1500)
				QuestFrameOptionClicked("��Ԫ",1); Sleep(500)
			end
			return true
		end
	end
end
checkNPCDst();