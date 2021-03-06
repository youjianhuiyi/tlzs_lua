--[[
    脚本功能：自定义坐标的和尚
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 #81全新定制版本刷和尚，必进一次，定点守");
local currentDay = os.date("%H:%M")
local monkTime = {"10:45","16:30","21:30","23:00"};
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
------------------------------------------------------
-- 定义和尚坐标
------------------------------------------------------
local pos = {
	{"雁南",18,116,269},
	{"雁南",18,246,47},
	{"洱海",24,242,248},
	{"洱海",24,132,258},
	{"西湖",30,222,134},
	{"西湖",30,153,132},
};

------------------------------------------------------
-- 定义参与和尚的游戏人物名称。一行为一队号，无先后顺序
-- 无队员个数限制，当前一行对应上面和尚坐标的位置，、
------------------------------------------------------
LoadScript("allPlayers.lua")


------------------------------------------------------
-- 等待执行找点的寻路功能
------------------------------------------------------
function waitForPlayers()
	-- 用来标识是第几队号
	local num = 0
	for key,value in ipairs(monkPlayers) do
		if playName == value then
			num = math.ceil( key/6 )
			PushDebugMessage("#eDC4C18#cFFFF00 准备去定点刷和尚地图".. pos[num][1].."坐标为："..pos[num][3]..","..pos[num][4]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			if xpos.. "|" .. ypos ~= pos[num][3].. "|" .. pos[num][4] then
				MoveTo(pos[num][3],pos[num][4],pos[num][2]);
				Sleep(1000)
				break;
			end
		end
	end
end

------------------------------------------------------
-- 队长号跟随
------------------------------------------------------
function judgeTeamer(time)
	if  IsLeader() == 1 then
		Player_TeamFollow(true) --组队跟随
		Sleep(500)
	end
	local str1 = time;
	local str2 = os.date("%H:%M:%S");
	local h1,m1,s1 = string.match(str1,"(%d+):(%d+):(%d+)")
	local h2,m2,s2 = string.match(str2,"(%d+):(%d+):(%d+)")
	local time1 = h1*3600+m1*60+s1
	local time2 = h2*3600+m2*60+s2
	time3 = (time1 - time2 - 2)*1000
	Sleep(time3)
	LoadScript("藏经阁(和尚)")
end

-- 
------------------------------------------------------
-- 核心调用
------------------------------------------------------
waitForPlayers()
while true do
	local now=os.date("%H:%M");
	--取周围的队伍成员,包括自己
	--	返回值1：整数型		周围队伍成员数量
	--	返回值2：成员数组   
	--	参数1：周围的范围距离
	local nCount,tObj = Team:GetSurroundMember(5)
	Sleep(500)
	PushDebugMessage("#eDC4C18#cFFFF00 本队已经来了" .. nCount .. "人")
	Sleep(500)
	if nCount == 6 then
		if now >= "10:40" and now <= "11:00" then
			judgeTeamer("10:45:00")
		elseif  now >= "16:25" and now <= "16:45" then
			judgeTeamer("16:30:00")
		elseif  now >= "21:00" and now <= "21:43" then
			judgeTeamer("21:30:00")
		elseif now >= "22:55" and now <= "23:15" then
			judgeTeamer("23:00:00")
		else
			Player_TeamFollow(true)
			PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷和尚时间范围内,执行下个任务");
		end
		break;
	else
		waitForPlayers()
	end
end