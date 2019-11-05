function LuoYangRestore(Index)
	for i=1,3 do
		if GetHPPercent() <= Index then
			MoveToNPC(185,336,LUOYANG_ID,"Áú°ÔÌì");Sleep(1000)
			QuestFrameOptionClicked("Âú×´Ì¬ÖÎÁÆ");Sleep(1000)
			QuestFrameOptionClicked("ÊÇ",1); Sleep(1000)
			if GetHPPercent() == 100 then 
				return true
			end
		end
		return false
	end
end

LuoYangRestore(100)