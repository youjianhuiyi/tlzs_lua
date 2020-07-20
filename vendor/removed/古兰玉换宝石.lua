PushDebugMessage("#eDC4C18#cFFFF00 #81全新定制版本刷和尚，必进一次，定点守");
local monkTime1 = "10:45";
local monkTime2 = "16:30";
local monkTime3 = "21:30";
local monkTime4 = "23:00";

function waitForPlayers()
     playName = GetPlayerInfo("NAME");
     -- players = {
        -- {"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
        -- {"Se⒎蕝蝂哥℡","′梦影．","や ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
        -- {"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
        -- {"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2"},
        -- {"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
		-- };
		
		-- 如果players里面有角色名称与当前游戏角色名称一致时，则执行圣兽山刷猪
		-- 保持以上格式，最外围一对大括号包含着里面的一具体的人物，人物名称需要用大括号包括着放在最外围的大括号里面
		-- 一队号与另外一队号之前的大括号之间用英文逗号隔开
		-- 此方法可以用于所有需要区分不同角色需要执行不同方法的功能
		
	pos = {
		{"洱海",242,248},
		{"洱海",132,258},
		{"西湖",61,197},
		{"西湖",79,248},
		{"雁南",268,168},
		{"雁南",239,123}
	};
	
	players = {
		{"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
        {"Se⒎蕝蝂哥℡","′梦影．","や ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
        {"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇","Eternally°L"},
        {"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2"},
        {"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"}
	};
	
	for key,value in ipairs(players)
	do
		for key1,value1 in ipairs(value)
		do
			if playName == value1 then
				PushDebugMessage("准备去定点刷猪坐标圣兽山"..pos[key][2]..","..pos[key][3]);
				Sleep(80)
				跨图寻路(pos[key][1],pos[key][2],pos[key][3]);
				local xpos,ypos = Player_GetPos();
				while true do
					if xpos ~= pos[key][2] and ypos ~= pos[key][3] then
						跨图寻路(pos[key][1],pos[key][2],pos[key][3]);
					else
						break;
					end
				end
			end
		end
	end
	
end



function readyExecAttackPig(now)
	local xpos,ypos = Player_GetPos();
	if now > "10:40" and now < monkTime1 then
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间为：".. monkTime1 .. "准备开始刷猪");
		等待到指定时间(monkTime1);
		执行脚本("藏经阁(和尚)");
		return true;
	elseif now > "16:25" and now < monkTime2 then
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间为：".. monkTime2 .. "准备开始刷猪");
		等待到指定时间(monkTime2);
		执行脚本("藏经阁(和尚)");
		return true;
	elseif now > "21:25" and now < monkTime3 then
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间为：".. monkTime3 .. "准备开始刷猪");
		等待到指定时间(monkTime3);
		执行脚本("藏经阁(和尚)");
		return true;
	elseif now > "22:55" and now < monkTime4 then
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间为：".. monkTime4 .. "准备开始刷猪");
		等待到指定时间(monkTime4);
		执行脚本("藏经阁(和尚)");
		return true;
	else
		PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷猪时间范围内");
		waitForPlayers();
		return false;
	end
end

-- local MapName = GetActiveSceneName()
-- local MapID  = GetSceneID()
-- PushDebugMessage(MapName)
-- PushDebugMessage(MapID)

--附近玩家或者NPC
-- local xpos,ypos = Player_GetPos()
-- local Obj = Enum2XAllObj()
-- for i = 1, 10 do
    -- id name class title x y dst hp guid menpai state level target
    -- MessageBox(Obj[i].name);Sleep(200)
    -- MessageBox(Obj[i].class);Sleep(200)
	-- MessageBox(Obj[i].title);Sleep(200)
	-- MessageBox("x坐标" .. Obj[1].x);Sleep(200)
	-- MessageBox("y坐标" .. Obj[1].y);Sleep(200)
	-- MessageBox(Obj[i].dst);Sleep(200)
	-- MessageBox(Obj[i].hp);Sleep(200)
	-- MessageBox(Obj[i].guid);Sleep(200)
	-- MessageBox(Obj[i].menpai);Sleep(200)
	-- MessageBox(Obj[i].state);Sleep(200)
	-- MessageBox(Obj[i].level);Sleep(200)
	-- MessageBox(Obj[i].target);Sleep(200)
-- end


while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 当前时间为".. os.date("%H:%M:%S"));	
	local result = readyExecAttackPig(now);
	if result == true then 
		break;
	else
		readyExecAttackPig(now);
	end
end
