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
local players = {
	"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ",
	"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇",
	"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の",
	"Se⒎蕝蝂哥℡","′梦影．や","﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命",
	"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2",
	"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia",
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
		if playName == value then
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
			PushDebugMessage(value)
			PushDebugMessage("准备去定点刷猪坐标圣兽山"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			while true do
				if xpos.. "|" .. ypos ~= pos[num][1].. "|" .. pos[num][2] then
					跨图寻路("圣兽山",pos[num][1],pos[num][2]);
					Sleep(1000)
					break;
				else
					break;
				end
			end
		end
	end
end

--取周围的队伍成员,包括自己
--	返回值1：整数型		周围队伍成员数量
--	返回值2：成员数组   
--	参数1：周围的范围距离
local nCount,tObj = Team:GetSurroundMember(15)

waitForPlayers()
local now=os.date("%H:%M");
--{"14:00","22:50"}
while true do
	if nCount == 6 then
		if now > "13:50" and now < "14:20" then
			if playName == "逗逗．や" or  playName == "ぁ壹葉醬油あ" or  playName == "平凡の" or  playName == "Se⒎蕝蝂哥℡" or  playName == "暒涳芐哋埖焱" or  playName == "．Lynthia" then
				Player_TeamFollow(true) --组队跟随
			end
			break
		elseif now > "21:50" and now < "22:15" then
			if playName == "逗逗．や" or  playName == "ぁ壹葉醬油あ" or  playName == "平凡の" or  playName == "Se⒎蕝蝂哥℡" or  playName == "暒涳芐哋埖焱" or  playName == "．Lynthia" then
				Player_TeamFollow(true) --组队跟随
			end
			break
		else
			PushDebugMessage("#eDC4C18#cFFFF00 当前时间".. now .. "不在刷和尚时间范围内,执行下个任务");
		end
	else
		waitForPlayers()
	end
end


