--��������
local level = 4 --�ϳɻ����ĵȼ���
local num = 1 -- �ϳɻ���������
PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
MoveToNPC(139, 197,2, "��ͩ")
Sleep(1000)
QuestFrameOptionClicked("�����ϳ�")
Sleep(1000)

function two(num)
	local i = 0
	while true do
		QuestFrameOptionClicked("�ϳɻ���飨2����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
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
		QuestFrameOptionClicked("�ϳɻ���飨2����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		i = i +1;
		if (i == num*5) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨3����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
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
		QuestFrameOptionClicked("�ϳɻ���飨2����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		i = i + 1;
		if (i == num*5*5) then
			break;
		end
	end
	
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨3����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		j = j + 1;
		if (j == num*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨4����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
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
		QuestFrameOptionClicked("�ϳɻ���飨2����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		i = i +1;
		if (i == num*5*5*5) then
			break;
		end
	end
	
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨3����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		j = j +1;
		if (j == num*5*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨4����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
		k = k + 1;
		if (k == num*5+1) then
			break;
		end
	end
	
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	MoveToNPC(139,197,2,"��ͩ")
	Sleep(1000)
	
	while true do
		QuestFrameOptionClicked("�����ϳ�")
		QuestFrameOptionClicked("�ϳɻ���飨5����")
		Sleep(500)
		QuestFrameOptionClicked("��Ҫ�ϳ�")
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