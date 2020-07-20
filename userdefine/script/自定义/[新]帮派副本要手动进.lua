--[[
	脚本信息：半自动帮派副本，需要手动改帮派副本城市位置

]]
PushDebugMessage("#eDC4C18#cFFFF00 #81自动找身边的NPC，进入副本刷怪");

-- 场景名称,直接从下面列表复制粘贴上来，如 雁南
local sceneName = '雁南';
-- 帮派城市方位，直接从下面列表复制粘贴上来，如 雁南正北校尉
local scenePositionName = '雁南正北校尉'
-- 帮派城市名称 可以看系统消息，选择模糊填写 '九层妖塔' => 九层，或者 九，或者 层， 或者 妖
local cityName = '雨'

-----------------------------------------------------------
-- 定义全区所有帮派NPC坐标点，用于自动寻路
-----------------------------------------------------------
local cityNew = {
    ['雁南']={['雁南正北校尉']={18,102,36},['雁南正东校尉']={18,283,113},['雁南正南校尉']={18,72,284}},
    ['雁北']={['雁北东北校尉']={19,234,24},['雁北西北校尉']={19,116,29},['雁北正西校尉']={19,32,128}},
    ['草原']={['草原西南校尉']={20,97,281},['草原正东校尉']={20,271,191},['草原正西校尉']={20,66,202}},
    ['辽西']={['辽西东南校尉']={21,277,258},['辽西西北校尉']={21,75,35},['辽西正西校尉']={21,40,142}},
    ['长白山']={['长白正南校尉']={22,216,282},['长白西北校尉']={22,39,63},['长白正东校尉']={22,280,154}},
    ['黄龙府']={['黄龙东南校尉']={23,253,285},['黄龙西北校尉']={23,28,54},['黄龙正东校尉']={23,290,115}},
    ['洱海']={['洱海正东校尉']={24,285,166},['洱海正南校尉']={24,173,283},['洱海正西校尉']={24,34,100}},
    ['苍山']={['苍山正西校尉']={25,37,172},['苍山正东校尉']={25,294,153},['苍山正南校尉']={25,146,284}},
    ['石林']={['石林东北校尉']={26,226,36},['石林正南校尉']={26,278,281},['石林正西校尉']={26,45,177}},
    ['玉溪']={['玉溪西南校尉']={27,33,251},['玉溪正北校尉']={27,177,39},['玉溪正南校尉']={27,197,280}},
    ['南诏']={['南诏西北校尉']={28,96,42},['南诏东南校尉']={28,272,240},['南诏西南校尉']={28,39,254}},
    ['苗疆']={['苗疆东北校尉']={29,250,45},['苗疆西南校尉']={29,37,251},['苗疆正东校尉']={29,281,160}},
    ['西湖']={['西湖西南校尉']={30,45,267},['西湖正东校尉']={30,261,231},['西湖正西校尉']={30,39,139}},
    ['龙泉']={['龙泉东南校尉']={31,218,282},['龙泉正北校尉']={31,63,33},['龙泉正西校尉']={31,35,121}},
    ['武夷']={['武夷东北校尉']={32,254,38},['武夷正南校尉']={32,113,280},['武夷正西校尉']={32,92,172}},
    ['梅岭']={['梅岭东北校尉']={33,271,37},['梅岭西北校尉']={33,31,90},['梅岭正东校尉']={33,282,236}},
    ['南海']={['南海东北校尉']={34,292,58},['南海西南校尉']={34,108,227},['南海正北校尉']={34,134,40}},
	['琼州']={['琼州东北校尉']={35,273,52},['琼州正东校尉']={35,243,150},['琼州正西校尉']={35,80,139}},
};

local activeScene = nil
local npcs = {}
local ShanYao_NPC = {}
local ShanGui_NPC = {}
local originSceneId = nil;--进入帮派时获取当前场景 ID
local newSceneId = nil;-- 进入山鬼或者山妖后的场景 ID
AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式

-------------------------------------------------------
-- 帮会副本NPC寻找的路线
-------------------------------------------------------
local findNPC = {
	{73,146},
	{74,126},
	{119,153},
	{141,136},
	{97,119},
	{98,96},
	{65,99},
	{55,74},
	{49,55},
	{71,60},
	{98,79},
	{133,61},
	{147,46},
	{151,75},
	{137,100},
	{98,98},
	{99,58}
};

-----------------------------------------------------------
-- 副本里面打怪坐标
-----------------------------------------------------------
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
-- sceneName 场景名称
-- cityName	 帮派名称
-- postion	 帮派城的方位
-----------------------------------------------------------
function autoRideToNPC( sceneName,scenePositionName,cityName )
	checkNPCDst(sceneName,scenePositionName,cityName)
	PushDebugMessage("#b#eff00ff 即将进入指定帮会城市～～");
	Sleep(500)
	QuestFrameOptionClicked(cityName,0)
	Sleep(500)
	PushDebugMessage("#b#eff00ff 进入指定帮派城市");
end


-----------------------------------------------------------
-- 检测角色是否已经到达指定 NPC 位置上
-- xpos x 坐标
-- ypos y 坐标
-----------------------------------------------------------
function checkNPCDst( sceneName,scenePositionName,cityName )
    local Obj = Enum2XAllObj()
    --过滤类型。 参数2：依次代表 {NPC,怪物，玩家，珍兽，宝箱} 0排除，1保留，
    tObj = ObjFilterByClass(tObj, {1, 0, 0, 0, 0})
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == scenePositionName and tonumber(tmp.dst) <= 3 then
			return true
		else
			--MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
			MoveToNPC(cityNew[sceneName][scenePositionName][2],cityNew[sceneName][scenePositionName][3],cityNew[sceneName][scenePositionName][1],scenePositionName);Sleep(500)
		end
    end
    return false
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
-- xpos x 坐标
-- ypos y 坐标
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


-------------------------------------------------------
-- 循环查找山妖或者山鬼
-------------------------------------------------------
function findNPC()
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name);
		if value.class == "NPC" and value.name == "山妖" then
			ShanYao_NPC[key] = {value.name , value.class , value.x , value.y , value.dst}
		else
			ShanGui_NPC[key] = {value.name , value.class , value.x , value.y , value.dst}
		end
	end
end


-------------------------------------------------------
-- 进入山妖山鬼副本
-------------------------------------------------------
function enterNPC()
	activeScene = GetActiveSceneName()
	if activeScene == "九层妖塔" then
		-- 进山妖
		findNPC()
		for k_enter,v_enter in ipairs(ShanYao_NPC) do
			if v_enter[3] ~= nil or v_enter[4] ~= nil then
				MoveToNPC(v_enter[3],v_enter[4],-1,v_enter[1]);Sleep(1500)
				newSceneId = GetSceneId();
			end
		end
	else
		-- 进山鬼
		findNPC()
		for k_enter,v_enter in ipairs(ShanGui_NPC) do
			if v_enter[3] ~= nil or v_enter[4] ~= nil then
				MoveToNPC(v_enter[3],v_enter[4],-1,v_enter[1]);Sleep(1500)
				newSceneId = GetSceneId();
			end
		end
	end
end

------------------------------------------------------
-- 核心调用
------------------------------------------------------
--先自动寻路到帮派城市
autoRideToNPC( sceneName,scenePositionName,cityName )
-- 获取当前没有进副本的帮派城市的场景 ID
originSceneId = GetSceneId();
--进帮派城市后进行找怪，并进入副本
if originSceneId == newSceneId and newSceneId == nil  then
	enterNPC()
end

--进了副本之后执行刷怪

for k1,v1 in ipairs(position) do
	PushDebugMessage("当前是第"..k1.."个坐标点")
	DaGuai(v1[1],v1[2])
	Sleep(500)
end
PickUp()
Sleep(10000)
PickUp()