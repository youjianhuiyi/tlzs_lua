PushDebugMessage("��Ը���һ�����")

local szItem = "���ǿ������"
local min = 7

--��鱳�������Ƿ���㣬����ǰ���ֿ�ȡ
local _, nCount, _ = FindBagItem(-1, "��Ը��")
if nCount < min then
    PushDebugMessage("ǰ���ֿ�ȡ����Ը��")
    Bank_GetItem(" ��Ը�� ", -1); Sleep(500)
end 


local nTick = -1

while true do

    _, nCount, _ = FindBagItem(-1, "��Ը��")

    if nCount >= min then

        MoveToNPC(281, 275, 1, "����ʿ"); Sleep(1000)

        QuestFrameOptionClicked("��Ը���һ�����");Sleep(800)

        QuestFrameOptionClicked(szItem); Sleep(800)
        
        QuestFrameOptionClicked("��Ҫ�һ�"); Sleep(800)
            
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











