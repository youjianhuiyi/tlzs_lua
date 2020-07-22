PushDebugMessage("前往大理武桐")

local min = 5

--检查背包数量是否充足，不足前往仓库取
local _, nCount, _ = FindBagItem(-1, "魂冰珠（1级）")
if nCount < min then
    PushDebugMessage("前往仓库取出魂冰珠")
    Bank_GetItem(" 魂冰珠（1级） ", -1); Sleep(500)
end 

MoveToNPC(139, 197, 2, "武桐");Sleep(1500)

--合成魂冰珠（2级）

TalkNpc("武桐");Sleep(1000)

QuestFrameOptionClicked("魂冰珠合成");Sleep(1500)

QuestFrameOptionClicked("合成魂冰珠（2级）");Sleep(1500)

PushDebugMessage("魂冰珠（2级）合成中……")


local nTick = -1

while true do

    _, nCount, _ = FindBagItem(-1, "魂冰珠（1级）")

    if nCount >= min then
       QuestFrameOptionClicked("我要合成");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --超出五分钟跳出循环
    if nTick ~= -1 and GetTickCount() - nTick > 300 * 1000 then 
        break 
    end

end

--合成魂冰珠（3级）

TalkNpc("武桐");Sleep(1000)

QuestFrameOptionClicked("魂冰珠合成");Sleep(1500)

QuestFrameOptionClicked("合成魂冰珠（3级）");Sleep(1500)

PushDebugMessage("魂冰珠（3级）合成中……")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "魂冰珠（2级）")
while true do

    _, nCount, _ = FindBagItem(-1, "魂冰珠（2级）")

    if nCount >= min then
       QuestFrameOptionClicked("我要合成");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --超出三分钟跳出循环
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end

--合成魂冰珠（4级）

TalkNpc("武桐");Sleep(1000)

QuestFrameOptionClicked("魂冰珠合成");Sleep(1500)

QuestFrameOptionClicked("合成魂冰珠（4级）");Sleep(1500)

PushDebugMessage("魂冰珠（4级）合成中……")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "魂冰珠（3级）")
while true do

    _, nCount, _ = FindBagItem(-1, "魂冰珠（3级）")

    if nCount >= min then
       QuestFrameOptionClicked("我要合成");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --超出三分钟跳出循环
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end

--合成魂冰珠（5级）

TalkNpc("武桐");Sleep(1000)

QuestFrameOptionClicked("魂冰珠合成");Sleep(1500)

QuestFrameOptionClicked("合成魂冰珠（5级）");Sleep(1500)

PushDebugMessage("魂冰珠（5级）合成中……")


local nTick = -1
local _, nCount, _ = FindBagItem(-1, "魂冰珠（4级）")
while true do

    _, nCount, _ = FindBagItem(-1, "魂冰珠（4级）")

    if nCount >= min then
       QuestFrameOptionClicked("我要合成");Sleep(4000)
          
       if nTick == -1 then nTick = GetTickCount() end

    else

        break

    end

    --超出三分钟跳出循环
    if nTick ~= -1 and GetTickCount() - nTick > 180 * 1000 then 
        break 
    end

end