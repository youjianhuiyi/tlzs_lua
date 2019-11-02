function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "龙霸天" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,5 do 
				MoveToNPC(185,336,LUOYANG_ID,"龙霸天");Sleep(1000)
				QuestFrameOptionClicked("满状态治疗");Sleep(1000)
				输入屏幕文本("#eDC4C18#cFFFF00手动回血，助手不行。暂时顶替")
				QuestFrameOptionClicked("是",1); Sleep(1000)
			end
			return true
		end
	end
end
checkNPCDst()
