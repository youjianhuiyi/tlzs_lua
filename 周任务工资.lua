-------领取工资 开始--------------------------------------------------------------------------------------------------------
i = 0
while GetSceneID() == 2 do
	输入屏幕文本("#eDC4C18#cFFFF00  领工资开始")
	MoveToNPC(149,121,2,"祝富贵");Sleep(1000)
	QuestFrameOptionClicked("领取工资",1); Sleep(1000)
	QuestFrameOptionClicked("领取全额红利",1); Sleep(1000)
	i = i + 1
	if i == 5 then
		break;
	end
end