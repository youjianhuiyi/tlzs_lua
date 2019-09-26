PushDebugMessage("进行自动12个操作，脚本自己执行，自动组团")

local players = {
	"Se⒎蕝蝂哥℡","′梦影．や"," ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命",
	"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2",
	"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"
};


function createGroup()
	playerName = GetPlayerInfo("NAME");
	for key,value in ipairs(players) do
		PushDebugMessage("当前角色名：" .. playName);
		if playName == value then
			PushDebugMessage(value .. "准备去接12人团任务，准备自动刷副本");
			执行脚本("12人副本")
		end
	end
end

--队伍成员所有名称
local strTeam = Team:GetAllName()
MessageBox(strTeam)
--取周围的队伍成员,包括自己
--	返回值1：整数型		周围队伍成员数量
--	返回值2：成员数组   
--	参数1：周围的范围距离
local nCount,tObj = Team:GetSurroundMember(15)
for k,v in ipairs(tObj) do
	PushDebugMessage(k .. v)
end
--退出队伍
Team:LeaveTeam()