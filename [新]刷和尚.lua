PushDebugMessage("#eDC4C18#cFFFF00 #81全新定制版本刷和尚，必进一次，定点守");
currentDay = os.date("%y:%m:%d")
monkTime = {"20:40","16:30","21:30","23:00"};
playName = GetPlayerInfo("NAME");
activeScene = GetActiveSceneName()
------------------------------------------------------
-- 定义和尚坐标
------------------------------------------------------
pos = {
	{"洱海",242,248},
	{"洱海",132,258},
	{"西湖",61,197},
	{"西湖",79,248},
	{"雁南",268,168},
	{"雁南",239,123}
};

------------------------------------------------------
-- 定义参与和尚的游戏人物名称。一行为一队号，无先后顺序
-- 无队员个数限制，当前一行对应上面和尚坐标的位置，、
------------------------------------------------------
players = {
	{"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
	{"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
	{"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
	{"Se⒎蕝蝂哥℡","′梦影．や","﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
	{"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2"},
	{"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia"},
};
	

------------------------------------------------------
-- 等待执行找点的寻路功能
------------------------------------------------------
function waitForPlayers()

	for key,value in ipairs(players)
	do
		for p_k1,p_v1 in ipairs(value)
		do
			if playName == p_v1 then
				PushDebugMessage(p_v1)
				PushDebugMessage("准备去定点刷和尚地图".. pos[key][1].."坐标为："..pos[key][2]..","..pos[key][3]);
				Sleep(500)
				local xpos,ypos = Player_GetPos();
				PushDebugMessage(xpos.."--"..ypos)
				while true do
					if xpos..ypos ~= pos[key][2]..pos[key][3] then
						跨图寻路(pos[key][1],pos[key][2],pos[key][3]);break;
					else
						break;
					end
				end
			end
		end
	end
	
end

------------------------------------------------------
-- 核心方法之一，执行刷和尚
------------------------------------------------------
function execMonk(times)
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
	--执行脚本("藏经阁(和尚)");	
end

------------------------------------------------------
-- 核心方法，执行刷和尚
------------------------------------------------------
function readyExecAttackMonk(now)
	local xpos,ypos = Player_GetPos();
	if now > "10:44" and now < "11:00" then
		execMonk(monkTime[1])
--	elseif now > "16:29" and now < "16:45" then
	elseif now > "16:29" and now < "17:45" then
		execMonk(monkTime[2])
	elseif now > "21:29" and now < "21:40" then
		execMonk(monkTime[3])
	elseif now > "22:59" and now < "23:15" then
		execMonk(monkTime[4])
	else
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷和尚时间范围内,执行下个任务");
		return false
	end
end


------------------------------------------------------
-- 循环调用执行刷和尚，如果返回为false的时候就停止
------------------------------------------------------
while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 当前时间为".. os.date("%H:%M:%S"));	
	local result = readyExecAttackMonk(now);
	if result == false then 
		break;
	else
		readyExecAttackMonk(now);
	end
end
-- waitForPlayers()