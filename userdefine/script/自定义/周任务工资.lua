-------��ȡ���� ��ʼ--------------------------------------------------------------------------------------------------------
i = 0
while GetSceneID() == 2 do
	������Ļ�ı�("#eDC4C18#cFFFF00  �칤�ʿ�ʼ")
	MoveToNPC(149,121,2,"ף����");Sleep(1000)
	QuestFrameOptionClicked("��ȡ����",1); Sleep(1000)
	QuestFrameOptionClicked("��ȡȫ�����",1); Sleep(1000)
	i = i + 1
	if i == 5 then
		break;
	end
end

--���ĵ��ã�
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "ף����" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(149,121,2,"ף����");Sleep(1000)
				QuestFrameOptionClicked("��ȡ����",1); Sleep(1000)
				QuestFrameOptionClicked("��ȡȫ�����",1); Sleep(1000)
			end
			return true
		end
	end
end
checkNPCDst();