function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "Τ����" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(333,195,1,"Τ����");Sleep(1000)
				QuestFrameOptionClicked("������ɳ");Sleep(1000)
				������Ļ�ı�("#eDC4C18#cFFFF00ˢ����30���Ӻ��������������Եõ��ḻ����")
				QuestFrameOptionClicked("�ǵģ�����������",1); Sleep(1000)
			end
			return true
		end
	end
end
checkNPCDst()
