--[[
    脚本功能：自定义坐标的刷猪
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 #81全新定制版本刷猪，必进一次，定点守");
local pigTime = {"14:00","21:50"}
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
------------------------------------------------------
-- 定义猪坐标
------------------------------------------------------
local pos = {
	{119,120},{26,32},{133,48},{198,63},{155,96}
};

------------------------------------------------------
-- 定义参与猪的游戏人物名称。一行为一队号，无先后顺序
-- 无队员个数限制，当前一行对应上面和尚坐标的位置，、
------------------------------------------------------
LoadScript("allPlayers.lua");

------------------------------------------------------
-- 等待执行找点的寻路功能
------------------------------------------------------
function waitForPlayers()
	-- 用来标识是第几队号
	local num = 0
	for key,value in ipairs(players)
	do
		if playName == value then
			num = math.ceil( key/6 )
			PushDebugMessage("#eDC4C18#cFFFF00 准备去定点刷猪坐标圣兽山"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			if xpos.. "|" .. ypos ~= pos[num][1].. "|" .. pos[num][2] then
				跨图寻路("圣兽山",pos[num][1],pos[num][2]);
				Sleep(1000)
				break;
			end
		end
	end
end

------------------------------------------------------
-- 定义和尚坐标
------------------------------------------------------
function judgeTeamer(time)
	if IsLeader() == 1 then
		Player_TeamFollow(true) --组队跟随
		Sleep(500)
	end
	local str1 = time;
	local str2 = os.date("%H:%M:%S");
	local h1,m1,s1 = string.match(str1,"(%d+):(%d+):(%d+)")
	local h2,m2,s2 = string.match(str2,"(%d+):(%d+):(%d+)")
	local time1 = h1*3600+m1*60+s1
	local time2 = h2*3600+m2*60+s2
	local time3 = (time1 - time2 - 2)*1000
	Sleep(time3)
	LoadScript("野猪暴走(圣兽山)")
end



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
	local nCount,tObj = Team:GetSurroundMember(15)
	if nCount == 6 then
		if now > "13:50" and now < "14:20" then
			judgeTeamer("14:00:00")
		elseif now > "21:50" and now < "22:15" then
			judgeTeamer("21:30:00")
		else
			Player_TeamFollow(true)
			PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷和尚时间范围内,执行下个任务");
		end
		break
	else
		waitForPlayers()
	end
end


