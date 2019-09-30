PushDebugMessage("进行自动12个操作，脚本自己执行，自动组团")


local slaveTeam = {
	"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ",
	"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2",
	"Se⒎蕝蝂哥℡","′梦影．や"," ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"
};

local masterTeam = {
	"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇",
	"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の",
	"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia"
};

function createGroup()
	playName = GetPlayerInfo("NAME");
	for key,value in ipairs(slaveTeam) do
		PushDebugMessage("当前角色名：" .. playName);
		if playName == value then
			PushDebugMessage(value .. "准备去接12人团任务，准备自动刷副本");
			if key >= 1 and key <= 6 then
				judgeTeamPlayers(1,6)
			elseif key >= 7 and key <= 12 then
				judgeTeamPlayers(7,12)
			elseif key >= 13 and key <= 18 then
				judgeTeamPlayers(13,18)
			else
				return false
			end
			--执行脚本("12人副本")
		end
	end
end


function judgeTeamPlayers(key1,key2)
	local masterNum = 0;
	--第一队
	--遍历周围所有对象数组,有以下属性
	--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
	--id,名称，类型，称号，x坐标，y坐标，距离，血，GUID,怪物拥有者id，门派，珍兽拥有者id,状态，作物类型，等级，目标id,模型id，帮会id,是否在队伍，是否队长
	local tObj = Enum2XAllObj()
	--过滤类型。 参数2：依次代表 {NPC,怪物，玩家，珍兽，宝箱} 0排除，1保留，
	tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})
	--过滤帮会id,返回帮会id为84的对象
	tObj = ObjFilterByBHID(tObj, " 84 ")
	for i = 1, #tObj do
		local tmp = tObj[i]
		--取角色名称。对比上面队伍名称,如果是团长号所在的队，不需要做操作，如果不是团队所在的队，需要退队。
		--将对应需要申请进团的队伍名称转换成字符串进行查找，人员有没有到齐
		local masterStr = table.concat( masterTeam, ", ", key1, key2 )
		if string.find( masterStr,tmp.name) ~= nil then
			masterNum = masterNum + 1
		end
	end
	-- 判断申请需要进团的队伍到齐之后，则退出当前团队
	if masterNum >= 6 then
		--退出队伍
		Team:LeaveTeam()
	else
		judgeTeamPlayers(key1, key2)
	end
end

--核心调用，
MoveToNPC(210,173,246,"高阳");Sleep(1000)
for i = 0 ,10 do
	createGroup();
	Sleep(10000);
end
