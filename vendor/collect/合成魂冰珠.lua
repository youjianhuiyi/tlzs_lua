PushDebugMessage("ǰ��������ͩ")

local min = 5

--��鱳�������Ƿ���㣬����ǰ���ֿ�ȡ
local _, nCount, _ = FindBagItem(-1, "����飨1����")
if nCount < min then
    PushDebugMessage("ǰ���ֿ�ȡ�������")
    Bank_GetItem(" ����飨1���� ", -1); Sleep(500)
end 

MoveToNPC(139, 197, 2, "��ͩ");Sleep(1500)

--�ϳɻ���飨2����

TalkNpc("��ͩ");Sleep(1000)

QuestFrameOptionClicked("�����ϳ�");Sleep(1500)

QuestFrameOptionClicked("�ϳɻ���飨2����");Sleep(1500)

PushDebugMessage("����飨2�����ϳ��С���")


local nTick = -1

while true do

    _, nCount, _ = FindBagItem(-1, "����飨1����")

    if nCount >= min then
       QuestFrameOptionClicked("��Ҫ�ϳ�");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --�������������ѭ��
    if nTick ~= -1 and GetTickCount() - nTick > 300 * 1000 then 
        break 
    end

end

--�ϳɻ���飨3����

TalkNpc("��ͩ");Sleep(1000)

QuestFrameOptionClicked("�����ϳ�");Sleep(1500)

QuestFrameOptionClicked("�ϳɻ���飨3����");Sleep(1500)

PushDebugMessage("����飨3�����ϳ��С���")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "����飨2����")
while true do

    _, nCount, _ = FindBagItem(-1, "����飨2����")

    if nCount >= min then
       QuestFrameOptionClicked("��Ҫ�ϳ�");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --��������������ѭ��
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end

--�ϳɻ���飨4����

TalkNpc("��ͩ");Sleep(1000)

QuestFrameOptionClicked("�����ϳ�");Sleep(1500)

QuestFrameOptionClicked("�ϳɻ���飨4����");Sleep(1500)

PushDebugMessage("����飨4�����ϳ��С���")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "����飨3����")
while true do

    _, nCount, _ = FindBagItem(-1, "����飨3����")

    if nCount >= min then
       QuestFrameOptionClicked("��Ҫ�ϳ�");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --��������������ѭ��
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end

--�ϳɻ���飨5����

TalkNpc("��ͩ");Sleep(1000)

QuestFrameOptionClicked("�����ϳ�");Sleep(1500)

QuestFrameOptionClicked("�ϳɻ���飨5����");Sleep(1500)

PushDebugMessage("����飨5�����ϳ��С���")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "����飨4����")
while true do

    _, nCount, _ = FindBagItem(-1, "����飨4����")

    if nCount >= min then
       QuestFrameOptionClicked("��Ҫ�ϳ�");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --��������������ѭ��
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end