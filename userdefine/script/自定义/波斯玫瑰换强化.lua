--[[
    �ű����ܣ���˹õ��һ���Ʒ
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
PushDebugMessage("��˹õ��һ�����")

local szItem = "30�䲨˹õ��һ�����"
local min = 30

--��鱳�������Ƿ���㣬����ǰ���ֿ�ȡ
local _, nCount, _ = FindBagItem(-1, "��˹õ��")
if nCount < min then
    PushDebugMessage("ǰ���ֿ�ȡ��õ��")
    Bank_GetItem(" ��˹õ�� ", -1); Sleep(500)
end 


local nTick = -1

while true do

    _, nCount, _ = FindBagItem(-1, "��˹õ��")

    if nCount >= min then

        MoveToNPC(187, 68, 2, "�͸���"); Sleep(1000)

        QuestFrameOptionClicked("��˹õ��һ�����");Sleep(1000)

        QuestFrameOptionClicked(szItem); Sleep(1000)

        QuestFrameMissionComplete();     
          
        if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --��������������ѭ��
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

    Sleep(200)
    DebugStr("�һ���...")
end











