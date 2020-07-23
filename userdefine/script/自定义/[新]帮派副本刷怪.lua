--[[
	脚本作用：临时打怪，帮派副本手动进入后，自动跑点打怪，打 BOSS 时需要注意手动捡包
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local activeScene = GetActiveSceneName()
AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式

------------------------------------------------------
--- 刷怪的坐标点，按顺序从上往下刷
------------------------------------------------------
local position = {
	{72,97},
	{51,92},
	{58,92},
	{43,67},
	{46,48},
	{48,54},
	{65,57},
	{141,54},
	{136,100},
	{130,100},
	{99,44},
};

------------------------------------------------------
-- 定义打怪脚本
------------------------------------------------------
function DaGuai(xpos,ypos)
	Player_TeamFollow(false)
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

-----------------------------------------------------------
-- 定义打怪跳出条件，当前坐标没有怪物的时候就跳出本次刷怪
-- xpos x 坐标
-- ypos y 坐标
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage("#eDC4C18#cFFFF00"..key .. " #81#81 " .. value.name .. " #81#81 " .. value.hp);
		if value.class == "怪物" then
			if value.hp ~= 0 then
				count = count + 1
			end 
		end
	end
	
	while true do 
		PushDebugMessage("#eDC4C18#cFFFF00 #81 当前怪物的数量为："..count .. "个 #81");Sleep(500)
		if count == 0 then
			return false
		else
			return true
		end
	end
end


------------------------------------------------------
-- 核心调用
------------------------------------------------------
for k2,v2 in ipairs(position) do
	Player_TeamFollow(false)
	DaGuai(v2[1],v2[2])
	Sleep(2000)
end