
for key,value in ipairs(Players4) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 循环兑换 红晶石（1级） 5次")
		for i = 1, 5 do
			QuestFrameOptionClicked("兑换红晶石（1级）")
			Sleep(1000)
		end
	end
end
