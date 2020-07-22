PushDebugMessage("前往大理武桐处合成魂冰珠……")
--[[   说明
1级 -- 1个魂冰珠（1级）
2级 -- 5个魂冰珠（1级）
3级 -- 25个魂冰珠（1级）
4级 -- 125个魂冰珠（1级）
5级 -- 625个魂冰珠（1级）-----125个2级  -----25个3级-----5个4级 -----1个5级  ，由1级魂冰珠合成5级的魂冰珠1个，要合成次数156次
一个武魂技能由1级升到6级，要781个魂冰珠（1级），3个技能要2343个魂冰珠（1级）
]]

--设置x, y, z, k参数，合成的魂冰珠级数及数量
local N2 = 3      --2级魂冰珠数量
local N3 = 0      --3级魂冰珠数量  
local N4 = 0      --4级魂冰珠数量 
local N5 = 0      --5级魂冰珠数量  
local T = 5*N2+ 25*N3 + 125 *N4 + 625 * N5  -- 一共需要T个1级魂冰珠

local Item = {
    [1] = "魂冰珠（1级）",
    [2] = "魂冰珠（2级）",
    [3] = "魂冰珠（3级）",
    [4] = "魂冰珠（4级）",
    [5] = "魂冰珠（5级）"
}
local Button = {
    [1] = "合成魂冰珠（1级）",
    [2] = "合成魂冰珠（2级）",
    [3] = "合成魂冰珠（3级）",
    [4] = "合成魂冰珠（4级）",
    [5] = "合成魂冰珠（5级）"
	}

--前往仓库取出1-5级魂冰珠
PushDebugMessage("前往仓库取出1-5级魂冰珠")
Bank_GetItem(" Item[1] Item[2] Item[3] Item[4] Item[5] ", -1); Sleep(1000)

--计算背包中1-5级魂冰珠数量
local N_1 = Bag:GetItemCount(Item[1], 0, 1); Sleep(500)  --背包中1级魂冰珠数量
local N_2 = Bag:GetItemCount(Item[2], 0, 1); Sleep(500)  --背包中2级魂冰珠数量
local N_3 = Bag:GetItemCount(Item[3], 0, 1); Sleep(500)  --背包中3级魂冰珠数量
local N_4 = Bag:GetItemCount(Item[4], 0, 1); Sleep(500)  --背包中4级魂冰珠数量
local N_5 = Bag:GetItemCount(Item[5], 0, 1); Sleep(500)  --背包中5级魂冰珠数量

--与合成需要的1级魂冰珠数量相比较
local T_sj = N_1 + 5*N_2+ 25*N_3 + 125 *N_4 + 625 * N_5   --背包中实际一共有T_sj个1级魂冰珠
if T_sj - T >= 0 then
  PushDebugMessage("你的魂冰珠足够，可以完成合成任务")
else
 PushDebugMessage("你的魂冰珠不足，再需要" .. T - T_sj .. "个1级魂冰珠")
end

--换算每级的魂冰珠需要合成多少个
local needN_2 = string.format("%d", T/5)
local needN_3 = string.format("%d", T/25)
local needN_4 = string.format("%d", T/125)
local needN_5 = string.format("%d", T/625)

--实际需要合成每级的魂冰珠需要合成多少个
local needN2 = needN_2 - N_2
local needN3 = needN_3 - N_3
local needN4 = needN_4 - N_4
local needN5 = needN_5 - N_5

--合成时需要的Money，2级 50Y，3级 50Y，4级 1G，5级 1G
local Money = needN2 *5000 + needN3 * 5000 + needN4 * 10000 + needN5 * 10000
local jiaozi = GetMoney(2) --背包中的交子
local jinbi = GetMoney(1) --背包中的金币
local needMoney = 10000 + Money - jiaozi - jinbi 

local jiaozi_jin = string.format("%d", jiaozi/10000)
local jiaozi_yin = string.format("%.2f",jiaozi/10000 - string.format("%d", jiaozi/10000)) * 100
local jiaozi_tong = string.format("%.4f",jiaozi/10000 - string.format("%.2f",jiaozi/10000)) * 10000
------------------------------------------------------------------------------------------------------
local jinbi_jin = string.format("%d", jinbi/10000)
local jinbi_yin = string.format("%.2f",jinbi/10000 - string.format("%d", jinbi/10000)) * 100
local jinbi_tong = string.format("%.4f",jinbi/10000 - string.format("%.2f",jinbi/10000)) * 10000
--------------------------------------------------------------------------------------------------------
PushDebugMessage("你背包里有交子：" .. jiaozi_jin .. "金" .. jiaozi_yin .. "银" .. jiaozi_tong .. "铜")
PushDebugMessage("你背包里有金币：" .. jinbi_jin .. "金" .. jinbi_yin .. "银" .. jinbi_tong .. "铜")

if jiaozi + jinbi >= needMoney then
	PushDebugMessage("现在移动到NPC武桐处,移动中……")
else
    Bank_GetMoney(needMoney, "洛阳")
	local jin_bi = string.format("%d", needMoney/10000)
	PushDebugMessage("你取出金币：" .. jin_bi .. "金")
	PushDebugMessage("现在移动到NPC武桐处,移动中……")	
end

MoveTo(139, 197, 2);Sleep(1000)

--合成魂冰珠（2级）
function HC(Button, Item, needn)
TalkNpc("武桐");Sleep(1000)
QuestFrameOptionClicked("魂冰珠合成", 1);Sleep(1500)
QuestFrameOptionClicked(Button, 1);Sleep(1500)
PushDebugMessage(Item .. "合成中……")
    for i = 1, needn do 
	    QuestFrameOptionClicked("我要合成");Sleep(4000) 
		PushDebugMessage("你成功合成了一个" .. Item .."!")
    end
	PushDebugMessage("你成功合成了" .. needn .. "个" .. Item .. "!")
end

if T_sj - T >= 0 then
if needN2 > 0 then
  HC(Button[2], Item[2], needN2)
end
if needN3 > 0 then
  HC(Button[3], Item[3], needN3)
end
if needN4 > 0  then
  HC(Button[4], Item[4], needN4)
end
if needN5 > 0 then
  HC(Button[5], Item[5], needN5)
end
local n1 = Bag:GetItemCount(Item[1], 0, 1); Sleep(500)  --合成完后背包中1级魂冰珠数量
local n2 = Bag:GetItemCount(Item[2], 0, 1); Sleep(500)  --合成完后背包中2级魂冰珠数量
local n3 = Bag:GetItemCount(Item[3], 0, 1); Sleep(500)  --合成完后背包中3级魂冰珠数量
local n4 = Bag:GetItemCount(Item[4], 0, 1); Sleep(500)  --合成完后背包中4级魂冰珠数量
local n5 = Bag:GetItemCount(Item[5], 0, 1); Sleep(500)  --合成完后背包中5级魂冰珠数量

   PushDebugMessage("你成功合成了" .. n2 .. "个魂冰珠（2级)," .. n3 .. "个魂冰珠（3级)," .. n4 .. "个魂冰珠（4级)," .. n5 .. "个魂冰珠（5级)。")
   Sleep(1000)
   PushDebugMessage("你的魂冰珠合成任务已完成！")
else
   PushDebugMessage("你的魂冰珠合成任务无法完成！")
end