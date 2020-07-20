PushDebugMessage("#eDC4C18#cFFFF00 #81自动找身边的NPC，进入副本刷怪");
local activeScene = GetActiveSceneName()
local npcs = {}
AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式

-------------------------------------------------------
-- 帮会副本NPC寻找的路线
-------------------------------------------------------
local findNPC = {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},

};

-------------------------------------------------------
--所有帮会城市
-------------------------------------------------------
local city = {
	{35,243,150,'琼州正东校尉'},
	{35,80,139,'琼州正西校尉'}
};

---------------------------------
--- 刷怪的坐标点，按顺序从上往下刷
---------------------------------
local position = {
	{67,98},
	{51,92},
	{43,67},
	{46,48},
	{65,57},
	{134,54},
	{149,45},
	{148,61},
	{147,98},
	{130,100},
	{99,57}
};

-----------------------------------------------------------
-- 定义打怪跳出条件，当前坐标没有怪物的时候就跳出本次刷怪
-----------------------------------------------------------
local test_position = {
	{},
	{},
	{},
	{},
	{},
	{},
};




-----------------------------------------------------------
-- 定义打怪跳出条件，当前坐标没有怪物的时候就跳出本次刷怪
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name);
		-- npcs[key] = {value.name , value.class , value.x , value.y , value.dst}
		if value.class == "怪物" then
			count = count + 1
		end
	end
	
	while true do 
		PushDebugMessage("当前count的数值为："..count);Sleep(500)
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



for k2,v2 in ipairs(position) do 
	DaGuai(v2[1],v2[2])
	Sleep(2000)
end