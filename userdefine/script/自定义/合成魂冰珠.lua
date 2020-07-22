--[[
    脚本功能：魂冰珠手动合成脚本，需要修改等级与数量。
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
--核心数量
local level = 4 --合成魂冰珠的等级，取值填写 2，3，4，5
local num = 1 -- 合成魂冰珠的数量，取值，大于 1，
local menuItem = "魂冰珠合成";
local szItem = {"合成魂冰珠（1级）","合成魂冰珠（2级）","合成魂冰珠（3级）","合成魂冰珠（4级）","合成魂冰珠（5级）"}
local doItem = "我要合成";

---------------------------------------------------------------------
-- 检测身边是否有 NPC
---------------------------------------------------------------------
function checkNPCDst()
	PushDebugMessage("#eDC4C18#cFFFF00前往大理-武桐-魂冰珠合成")
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "武桐" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(139, 197,2, "武桐"); Sleep(500)
			return true
		end
	end
end

---------------------------------------------------------------------
-- 合成核心逻辑
-- level int 需要合成魂冰珠的等级 2 ，3 ，4 ，5
-- num int 需要合成魂冰珠的数量，大于等于 1，默认为 1
---------------------------------------------------------------------
function compound(level,num)
	local i = 0
	-- 一次性执行合成低等级的数量
	while true do
		QuestFrameOptionClicked(menuItem,1);Sleep(500)
		QuestFrameOptionClicked(szItem[level])
		Sleep(500)
		QuestFrameOptionClicked(doItem)
		i = i + 1;
		if i == num then
			break;
		end
	end
end


---------------------------------------------------------------------
-- 合成
---------------------------------------------------------------------
function levelCompound(num,level)
	for i=2,level do
		compound(i,num*(5^level-2));
		checkNPCDst();
	end
end


-- ---------------------------------------------------------------------
-- -- 合成 2 级
-- ---------------------------------------------------------------------
-- function two(num)
-- 	compound(2,num);
-- end

-- ---------------------------------------------------------------------
-- -- 合成 3 级
-- ---------------------------------------------------------------------
-- function three(num,level)
-- 	for i=2,level do
-- 		compound(i,num*(5^level-2));
-- 		checkNPCDst();
-- 	end
-- end

-- ---------------------------------------------------------------------
-- -- 合成 4 级
-- ---------------------------------------------------------------------
-- function four(num)
-- 	compound(2,num*5*5);
-- 	checkNPCDst();
-- 	compound(3,num*5+1);
-- 	checkNPCDst();
-- 	compound(4,num+1);
-- end

-- ---------------------------------------------------------------------
-- -- 合成 5 级
-- ---------------------------------------------------------------------
-- function five(num)
-- 	compound(2,num*5*5*5);
-- 	checkNPCDst();
-- 	compound(3,num*5*5+1);
-- 	checkNPCDst();
-- 	compound(4,num*5+1);
-- 	checkNPCDst();
-- 	compound(5,num+1);
-- end


---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
levelCompound(level,num)
-- if level == 1 then 
-- 	return
-- elseif level == 2 then
-- 	two(num,level)
-- elseif level == 3 then 
-- 	three(num)
-- elseif level == 4 then 
-- 	four(num)
-- elseif level == 5 then 
-- 	five(num)
-- else 
-- 	return
-- end