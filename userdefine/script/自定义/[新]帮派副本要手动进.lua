PushDebugMessage("#eDC4C18#cFFFF00 #81自动找身边的NPC，进入副本刷怪");
local activeScene = GetActiveSceneName()
local npcs = {}
AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式
local position = {
	{72,97},
	{51,92},
	{52,86},
	{43,67},
	{46,48},
	{48,54},
	{65,57},
	{141,54},
	{136,100},
	{130,100},
	{99,44},
};
-----------------------------------------------------------
-- 定义打怪跳出条件，当前坐标没有怪物的时候就跳出本次刷怪
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name .. "---" .. value.hp);
		if value.class == "怪物" then
			if value.hp ~= 0 then
				count = count + 1
			end 
		end
	end
	
	while true do 
		PushDebugMessage("当前怪物的数量为："..count .. "个");Sleep(500)
		if count == 0 then
			return false
		else
			return true
		end
	end
end

------------------------------------------------------
-- 定义打怪脚本
------------------------------------------------------
function DaGuai(xpos,ypos)
	DG_OnInit();
	DG_SetParam("打怪方式", "先绿后红");
	DG_SetParam("攻击模式", "优先绿怪");
	DG_SetParam("目标","所有");
	DG_SetParam("是否选中怪", true);
	DG_SetParam("怪物归属", "红白绿");
	DG_SetParam("打怪范围", 15);
	DG_SetParam("坐标", "赋值", { {x=xpos,y=ypos}});
	DG_SetParam("地图", -1);
	DG_SetParam("是否攻击", true);
	DG_SetParam("其他参数", { usehorse = false, usepet = true, dxys = false });
	while true do
		DG_OnAction();Sleep(500)
		PickUp();Sleep(500)
		if callback(xpos,ypos) == false then
			break
		end
	end
	return nil
end



for k1,v1 in ipairs(position) do
	PushDebugMessage("当前是第"..k1.."个坐标点")
	DaGuai(v1[1],v1[2])
	Sleep(500)
end
PickUp()
Sleep(10000)
PickUp()