--[[
    脚本功能：自定义刷 12 人自动组团队
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 进行自动12个操作，脚本自己执行，自动组团")
local masterNum = 0;

-- local slaveTeam = {
-- 	"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ",
-- 	"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2",
-- 	"Se⒎蕝蝂哥℡","′梦影．や"," ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"
-- };

-- local masterTeam = {
-- 	"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇",
-- 	"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の",
-- 	"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia"
-- };
------------------------------------------------------
-- 定义队伍
------------------------------------------------------
LoadScript("allPlayers.lua");

------------------------------------------------------
-- 创建团队
------------------------------------------------------
function createGroup()
	playName = GetPlayerInfo("NAME");
	for key,value in ipairs(slaveTeam) do
		PushDebugMessage("#eDC4C18#cFFFF00 当前角色名：" .. playName);
		if playName == value then
			PushDebugMessage(value .. "#eDC4C18#cFFFF00 准备去接12人团任务，准备自动刷副本");
			key = math.ceil( key/6 )
			if key == 1 then
				loopExec(1,6)
			elseif key == 2  then
				loopExec(7,12)
			elseif key == 3 then
				loopExec(13,18)
			else
				return false
			end
			--执行脚本("12人副本")
		end
	end
end

------------------------------------------------------
-- 重新执行
------------------------------------------------------
function loopExec(key1,key2)
	while true do
		result = judgeTeamPlayers(key1,key2)
		if result then
			break
		end
	end
end


------------------------------------------------------
-- 判断身边的角色
------------------------------------------------------
function judgeTeamPlayers(key1,key2)
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

	if masterNum == 6 then
		Sleep(3000)
		--退出队伍
		Team:LeaveTeam()
		return true
	else
		return false
	end
end

------------------------------------------------------
-- 判断 NPC 周边的队友人数
------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "高阳" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(210,173,246,"高阳");Sleep(1000)
			end
			return true
		end
	end
end

------------------------------------------------------
-- 核心调用，
------------------------------------------------------
checkNPCDst();
createGroup();
