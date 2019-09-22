playName;
n = 0;
m = 0;
MapName = GetActiveSceneName();
getMapNum = 0;
originBagNums;
flag = true;
players = {
	--第一队 追逐ゝ
	{name = "°凌筱雨．≈",	num1 = 30,num2 = 30},
	{name = "″．波少ヽ",	num1 = 26,num2 = 30},
	{name = "﹎素颜．や",	num1 = 26,num2 = 30},
	{name = "′雪走",		num1 = 30,num2 = 25},
	{name = "丶漫步ゾ天龙",	num1 = 30,num2 = 30},
	{name = "平凡の",		num1 = 26,num2 = 30},
	--第二队
	{name = "Se⒎蕝蝂哥℡",	num1 = 30,num2 = 30},
	{name = "′梦影．や",		num1 = 30,num2 = 30},
	{name = "﹏岚ゝ兮°",	num1 = 25,num2 = 30},
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
};

-- 回城到达帮会NPC处
function goGuildNPC()
	if MapName == "洛阳" then
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	elseif MapName == "苏州" then
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
		flag = false
	elseif MapName == "大理" then
		MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
		flag = false
	elseif MapName == "楼兰" then
		MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
		flag = false
	else
		取消跟随()
		下坐骑()
		local bUse = Skill:UseSkillByName("返回大理城", -1, 10000)
		if bUse == false then
			跨图寻路("洛阳",347,249)
		end
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	end
end


-- 仓库存图逻辑
function saveTu()
	Bank_SaveItem("藏宝图", false, 0)
end


-- 获取背包被占用的格子数量
function getItemNum()
	local tObj = Bag:EnumAllObj();
	local n = 0;
	local m = 0;
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1; --道具栏占用个数
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1; --材料栏占用个数
		end
	end
	return n,m;
end


--获取角色一共有多少个格子
function getPlayerBagNums()
    playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--有--' .. value.num .. ' 格子')
			--获取角色一共有多少个空格子,
			local res1,res2 = getItemNum()
			hasNum1 = value.num1 - res1 -- 物品栏空格子数量
			hasNum2 = value.num2 - res2 -- 材料栏空格子数量
			--[[num1 = value.num1 --物品栏总格子数量
			num2 = value.num2 --材料栏总格子数量--]]
			-- MessageBox(value.name .. '--有--' .. hasNum1 .. ' 格子'.. hasNum2 .. ' 格子')
		end
	end
	--return {bag1=hasNum1,bag2=hasNum2,bag1Ori = num1,bag2Ori = num2}
	return  hasNum1,hasNum2,res1,res2;
end


-- 从帮会NPC进入帮会打开对话
function toGuild()
	while flag do
		goGuildNPC()
	end
	PushDebugMessage("直接去本帮城市了")
	QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
	if CityToGuild() then
		MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
		QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
	end
end 


--[[取藏宝图到背包里面的物品--]]
function getBaseItemsFromBank(num)
	Sleep(1000)
    for j=1,20 do
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item".. j ..":DoAction();","",0)
		Sleep(100)
    end
end


-- 检查NPC离自己的距离
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "钱为一" and tonumber(tmp.dst) <= 3 then
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
	res3 = getPlayerBagNums()
	-- 从第2个-第4个箱子里面取图
	for i = 2,4 do
		checkNPCDst()
		GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(".. i ..");","",0)
		Sleep(100)
		getBaseItemsFromBank(res3.bag1Ori)
		res4 = getPlayerBagNums()
		--[[
		MessageBox("result1.bag1--" .. result1.bag1)
		MessageBox("result1.bag2--" .. result1.bag2)
		MessageBox("result1.bag1Ori--" .. result1.bag1Ori)
		MessageBox("result1.bag2Ori--" .. result1.bag2Ori)
		--]]
		if res4.bag1 == 0 then
			break
		end
	end
end

-- 从仓库中取出对应数量的图片进行挖图
function getDetailMaps(num)
	local strItem = AI_GetParameter_User("取图挖图") 
	strItem = " " .. strItem .. " " 
	PushDebugMessage("取出物品：" .. strItem)
	Bank_GetItem(strItem, num)
end


-- 核心调用

--存储原始数据，原始背包里面有多少个格子
function getPlayerBagNums_1()
    playName = GetPlayerInfo("NAME")
    for key,value in ipairs(players) do
		if playName == value.name then
			--MessageBox(value.name .. '--有--' .. value.num .. ' 格子')
			--获取角色一共有多少个空格子,
			res1 = getItemNum()
			val_1 = res1.bag1
			val_2 = res1.bag2
			hasNum_01 = value.num1 - res1.bag1 -- 物品栏空格子数量
			hasNum_02 = value.num2 - res1.bag2 -- 材料栏空格子数量
			num_01 = value.num1 --物品栏总格子数量
			num_02 = value.num2 --材料栏总格子数量
			-- getMapNum = hasNum1
			--
			-- MessageBox(value.name .. '--有--' .. hasNum1 .. ' 格子'.. hasNum2 .. ' 格子')
		end
	end
	return {bag_01=hasNum_01,bag_02=hasNum_02,bag1Ori_01 = num_01,bag2Ori_02 = num_02,val_1 = val_1,val_2 = val_2}
end

执行脚本("[功能] 买卖补给")
执行脚本("[功]挖图专用清包")
toGuild() -- 先去帮会
-- 执行取图逻辑
while true do 
	res5 = getPlayerBagNums()
	Sleep(100)
	if res5.bag1 ~= 0 then
		for a = 1, 100  do
			getTreasureMap()
			break
		end
	else
		break
	end
end

-- 取完一背包准备存入仓库
saveTu()

-- 再根据具体情况取出相应的图 
originBagNums = getPlayerBagNums_1()
-- while true do
	-- MessageBox("originBagNums.bag1--" .. originBagNums.bag_01)
	-- MessageBox("originBagNums.bag2--" .. originBagNums.bag_02)
	-- MessageBox("originBagNums.val_1--" .. originBagNums.val_1)
	-- MessageBox("originBagNums.val_2--" .. originBagNums.val_2)
	-- MessageBox("originBagNums.bag1Ori--" .. originBagNums.bag1Ori_01)
	-- MessageBox("originBagNums.bag2Ori--" .. originBagNums.bag2Ori_02)
-- end

getDetailMaps(originBagNums.bag_01 - 1)
PushDebugMessage("准备清包")
执行脚本("[功]挖图专用清包")
PushDebugMessage("准备挖图")
执行脚本("自动挖藏宝图")
PushDebugMessage("准备清包")
执行脚本("[功]挖图专用清包")