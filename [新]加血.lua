function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "������" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,5 do 
				MoveToNPC(185,336,LUOYANG_ID,"������");Sleep(1000)
				QuestFrameOptionClicked("��״̬����");Sleep(1000)
				������Ļ�ı�("#eDC4C18#cFFFF00�ֶ���Ѫ�����ֲ��С���ʱ����")
				QuestFrameOptionClicked("��",1); Sleep(1000)
			end
			return true
		end
	end
end
checkNPCDst()
