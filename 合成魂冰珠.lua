--核心数量
local level = 4
local num = 1
PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
MoveToNPC(139, 197,2, "武桐")
Sleep(1000)
QuestFrameOptionClicked("魂冰珠合成")
Sleep(1000)

function two(num)
	local i = 0
	while true do
		QuestFrameOptionClicked("合成魂冰珠（2级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		i = i + 1;
		if (i == num) then
			break;
		end
	end
end

function three(num)
	local i = 0
	local j = 0
	while true do
		QuestFrameOptionClicked("合成魂冰珠（2级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		i = i +1;
		if (i == num*5) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（3级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		j = j + 1;
		if (j == num+1) then
			break;
		end
	end
end

function four(num)
	local i = 0
	local j = 0
	local k = 0
	while true do
		QuestFrameOptionClicked("合成魂冰珠（2级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		i = i + 1;
		if (i == num*5*5) then
			break;
		end
	end
	
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（3级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		j = j + 1;
		if (j == num*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（4级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		k = k + 1;
		if (k == num+1) then
			break;
		end
	end
end

function five(num)
	local i = 0
	local j = 0
	local k = 0
	local k1 = 0
	while true do
		QuestFrameOptionClicked("合成魂冰珠（2级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		i = i +1;
		if (i == num*5*5*5) then
			break;
		end
	end
	
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（3级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		j = j +1;
		if (j == num*5*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（4级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		k = k + 1;
		if (k == num*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	MoveToNPC(139,197,2,"武桐")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("魂冰珠合成")
		QuestFrameOptionClicked("合成魂冰珠（5级）")
		Sleep(500)
		QuestFrameOptionClicked("我要合成")
		k1 = k1 + 1;
		if (k1 == num+1) then
			break;
		end
	end
	
end



if level == 1 then 
	return
elseif level == 2 then
	two(num)
elseif level == 3 then 
	three(num)
elseif level == 4 then 
	four(num)
elseif level == 5 then 
	five(num)
else 
	return
end