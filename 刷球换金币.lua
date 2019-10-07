function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "韦大叔" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(333,195,1,"韦大叔");Sleep(1000)
				QuestFrameOptionClicked("提炼金沙");Sleep(1000)
				输入屏幕文本("#eDC4C18#cFFFF00刷完球30分钟后马上提炼，可以得到丰富奖励")
				QuestFrameOptionClicked("是的，现在提炼。",1); Sleep(1000)
			end
			return true
		end
	end
end
checkNPCDst()
