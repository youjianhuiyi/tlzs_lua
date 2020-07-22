--[[
    �ű����ܣ�������ֶ��ϳɽű�����Ҫ�޸ĵȼ���������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
--��������
local level = 4 --�ϳɻ����ĵȼ���ȡֵ��д 2��3��4��5
local num = 1 -- �ϳɻ�����������ȡֵ������ 1��
local menuItem = "�����ϳ�";
local szItem = {"�ϳɻ���飨1����","�ϳɻ���飨2����","�ϳɻ���飨3����","�ϳɻ���飨4����","�ϳɻ���飨5����"}
local doItem = "��Ҫ�ϳ�";

---------------------------------------------------------------------
-- �������Ƿ��� NPC
---------------------------------------------------------------------
function checkNPCDst()
	PushDebugMessage("#eDC4C18#cFFFF00ǰ������-��ͩ-�����ϳ�")
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "��ͩ" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(139, 197,2, "��ͩ"); Sleep(500)
			return true
		end
	end
end

---------------------------------------------------------------------
-- �ϳɺ����߼�
-- level int ��Ҫ�ϳɻ����ĵȼ� 2 ��3 ��4 ��5
-- num int ��Ҫ�ϳɻ��������������ڵ��� 1��Ĭ��Ϊ 1
---------------------------------------------------------------------
function compound(level,num)
	local i = 0
	-- һ����ִ�кϳɵ͵ȼ�������
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
-- �ϳ�
---------------------------------------------------------------------
function levelCompound(num,level)
	for i=2,level do
		compound(i,num*(5^level-2));
		checkNPCDst();
	end
end


-- ---------------------------------------------------------------------
-- -- �ϳ� 2 ��
-- ---------------------------------------------------------------------
-- function two(num)
-- 	compound(2,num);
-- end

-- ---------------------------------------------------------------------
-- -- �ϳ� 3 ��
-- ---------------------------------------------------------------------
-- function three(num,level)
-- 	for i=2,level do
-- 		compound(i,num*(5^level-2));
-- 		checkNPCDst();
-- 	end
-- end

-- ---------------------------------------------------------------------
-- -- �ϳ� 4 ��
-- ---------------------------------------------------------------------
-- function four(num)
-- 	compound(2,num*5*5);
-- 	checkNPCDst();
-- 	compound(3,num*5+1);
-- 	checkNPCDst();
-- 	compound(4,num+1);
-- end

-- ---------------------------------------------------------------------
-- -- �ϳ� 5 ��
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
-- ���ĵ���
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