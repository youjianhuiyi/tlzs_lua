--[[
    脚本功能：帮派银行取图挖图，此项目暂时停止使用，后期开发
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local players = {
		--第一队 追逐ゝ
		{name = "°凌筱雨．≈",	num1 = 30,num2 = 30},
		{name = "″．波少ヽ",	num1 = 26,num2 = 30},
		{name = "﹎素颜．や",	num1 = 26,num2 = 30},
		{name = "′雪走",		num1 = 30,num2 = 25},
		{name = "丶漫步ゾ天龙",	num1 = 30,num2 = 30},
		{name = "平凡の",		num1 = 26,num2 = 30},
		--第二队
		{name = "Se⒎蕝蝂哥℡",	num1 = 30,num2 = 30},
		{name = "′梦影．",		num1 = 30,num2 = 30},
		{name = "や ﹏岚ゝ兮°",	num1 = 25,num2 = 30},
		{name = "超级↑→奶妈",	num1 = 30,num2 = 26},
		{name = "╰☆TeaR陌ゝ",	num1 = 30,num2 = 26},
		{name = "Am°惜你若命",	num1 = 26,num2 = 30},
		--第三队
		{name = "ぁ壹葉醬油あ",	num1 = 30,num2 = 30},
		{name = "﹏菲儿、ゝ",	num1 = 30,num2 = 30},
		{name = "雨林之后",		num1 = 30,num2 = 30},
		{name = "红颜傲﹡．",	num1 = 30,num2 = 30},
		{name = "しF笑天Dす",	num1 = 30,num2 = 30},
		{name = "此生的回矇",	num1 = 30,num2 = 30},
		--第四队
		{name = "暒涳芐哋埖焱",	num1 = 30,num2 = 30},
		{name = "°﹎紫龍ヤ",	num1 = 30,num2 = 26},
		{name = "天子月",		num1 = 30,num2 = 30},
		{name = "TH－莫囄",		num1 = 30,num2 = 30},
		{name = "ら﹏笨呆呆°",	num1 = 30,num2 = 26},
		{name = "小小书童2",	num1 = 30,num2 = 30},
		--第五队
		{name = "逗逗．や",		num1 = 30,num2 = 30},
		{name = "豆豆妈咪",		num1 = 30,num2 = 30},
		{name = "情定三世丶",	num1 = 30,num2 = 30},
		{name = "梵魚ˇ",		num1 = 27,num2 = 30},
		{name = "灬枫ヽ昕℃",	num1 = 30,num2 = 30},
		{name = "″踮脚拥他ゝ",	num1 = 30,num2 = 30},
		--第六队
		{name = "小叶丶绝杀",	num1 = 30,num2 = 30},
		{name = "艳歌羅敷行",	num1 = 30,num2 = 30},
		{name = "轻狂∴小可",	num1 = 30,num2 = 30},
		{name = "霂鑰．ゞ",		num1 = 27,num2 = 30},
		{name = "﹏紫．骄傲ゝ",	num1 = 30,num2 = 30},
		{name = "．Lynthia",	num1 = 30,num2 = 30},
		{name = "多情的小男人",	num1 = 26,num2 = 26},
		--挖图一队号
		{name = "大雪紛飛丶",	num1 = 25,num2 = 25},
		{name = "至若",			num1 = 26,num2 = 26},
		{name = "轩轩·",		num1 = 25,num2 = 30},
		{name = "XX丶",			num1 = 26,num2 = 26},
		{name = "追逐ゝ",		num1 = 30,num2 = 28},
		{name = "Eternally｀L",	num1 = 30,num2 = 30},
		{name = "獨自一人丶",	num1 = 25,num2 = 25},
	}

--获取角色有多少个格子
function getPlayerBagNums()
    local playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			return value.num1,value.num2
		end
	end
end

-- 获取背包空格子数量
function Bag_GetSpaceNum()
	local tObj = Bag:EnumAllObj()
	local Bag_rest_1 = 0
	local Bag_rest_2 = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			--表示是道具栏的空间
			Bag_rest_1 = Bag_rest_1 + 1; 
		elseif tmp.index <= 59 then 
			--表示是材料栏的空间
			Bag_rest_2 = Bag_rest_2 + 1; 
		else
			return false;
		end
	end
	return Bag_rest_1,Bag_rest_2;
end

-- 从帮会银行NPC打开对话
-- 检查NPC离自己的距离
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "钱为一" and tonumber(tmp.dst) <= 3 then
			MoveToNPC(148, 56, -1, "钱为一"); Sleep(500)
			QuestFrameOptionClicked("帮会银行",1); Sleep(1000)
			return true
		else
			if CityToGuild() then
				MoveToNPC(148, 56, -1, "钱为一"); Sleep(500)
				QuestFrameOptionClicked("帮会银行",1); Sleep(1000)
			end
			return true
		end
	end
end

-- 从银行取藏宝图
function getTreasureMap()
	-- 从第1个-第5个箱子里面取图
	checkNPCDst()
	local num1,num2 = getPlayerBagNums()
	for i = 1,5 do
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(1000)
		--取图
		for j=1,20 do
			local res1,res2 = Bag_GetSpaceNum()
			if num1 - res1 <= 3 then
				return true;
			end
			GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item".. j ..":DoAction();","",0)
			Sleep(200)
			--取图
			PushDebugMessage("已经用道具数量 = ".. res1 .. "个");Sleep(200)
			PushDebugMessage("已经用材料数量 = ".. res2 .. "个");Sleep(200)
		end
	end
	return false;
end

-- 核心调用
getTreasureMap()