PushDebugMessage("#eDC4C18#cFFFF00 #81全新定制版本刷猪，必进一次，定点守");
--local pigTime1 = "14:00";
--local pigTime2 = "21:50";
pigTime = {"14:00","21:50"}
playName = GetPlayerInfo("NAME");
activeScene = GetActiveSceneName()
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
local players = {
	{"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
	{"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
	{"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
	{"Se⒎蕝蝂哥℡","′梦影．や","﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
	{"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2"},
	{"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia"},
	--{"獨自一人丶"}
};
	

------------------------------------------------------
-- 等待执行找点的寻路功能
------------------------------------------------------
function waitForPlayers()
	-- 用来标识是第几队号
	local num = 0
	for key,value in ipairs(players)
	do
		if key >= 1 and key <= 6 then
			num = 1
		elseif key >= 7 and key <= 12 then
			num = 2
		elseif key >= 13 and key <= 18 then
			num = 3
		elseif key >= 19 and key <= 24 then
			num = 4
		elseif key >= 25 and key <= 30 then
			num = 5
		elseif key >= 31 and key <= 36 then
			num = 6
		end

		if playName == value then
			PushDebugMessage(value)
			PushDebugMessage("准备去定点刷猪坐标圣兽山"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			while true do
				if xpos..ypos ~= pos[num][1]..pos[num][2] then
					跨图寻路("圣兽山",pos[num][1],pos[num][2]);break;
				else
					break;
				end
			end
		end
	end
	
end

------------------------------------------------------
-- 核心方法之一，执行刷猪
------------------------------------------------------
function execPig(times)

	PushDebugMessage("#eDC4C18#cFFFF00 当前时间为：".. times .. "准备开始刷和尚");
	for p_key,p_value in ipairs(pos) do
		PushDebugMessage(p_value[1])
		PushDebugMessage(activeScene)
		if activeScene == p_value[1] then
			执行脚本("[功能] 回城")
			waitForPlayers();
			break
		else
			waitForPlayers();
			break
		end
	end
	
	等待到指定时间(times);
	--执行脚本("野猪暴走(圣兽山)");
end

------------------------------------------------------
-- 核心方法，执行刷猪
------------------------------------------------------
function readyExecAttackPig(now)
	local xpos,ypos = Player_GetPos();
	if now > "13:58" and now < "14:20" then
		execPig(pigTime[1])
	elseif now > "21:45" and now < "22:15" then
		execPig(pigTime[2])
	else
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷猪时间范围内,执行下个任务");
		return false
	end
end


------------------------------------------------------
-- 循环调用执行刷猪，如果返回为false的时候就停止
------------------------------------------------------
while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 当前时间为".. os.date("%H:%M:%S"));	
	local result = readyExecAttackPig(now);
	if result == false then 
		break;
	else
		readyExecAttackPig(now);
	end
end

--waitForPlayers()