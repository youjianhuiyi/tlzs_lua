--[[
    �ű����ܣ��ϳɵػ�������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
--������������Ҫ�һ����ٸ��ػ�����Ҫ�ֶ��޸�����
local num = 37

PushDebugMessage("ǰ����������ң��")
MoveToNPC(248, 217, 580, "��ң��")
Sleep(1000)

QuestFrameOptionClicked("�ϳɻ���")
Sleep(1000)

i = 0
while true do
	QuestFrameOptionClicked("�ϳɵػ���")
	Sleep(1000)
	i = i +1;
	if (i == num) then
		break;
	end
end
