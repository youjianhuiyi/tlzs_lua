-------购买百宝阁 开始----------------------
local MapName = GetActiveSceneName()
PushDebugMessage(MapName)
--判断角色当前所在地图，就近领取任务
if MapName == "洛阳" then
	MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
elseif MapName == "苏州" then
	MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
elseif MapName == "大理" then
	MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
elseif MapName == "楼兰" then
	MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
else
	执行脚本("[功能] 回城")
	MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
end

-- 判断是否到达NPC附近
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "万藏宝" and tonumber(tmp.dst) <= 3 then
			return true
		else
			if CityToGuild() then
				MoveToNPC(149, 44, -1, "万藏宝"); Sleep(100)
				QuestFrameOptionClicked("购买百宝阁商品",1); Sleep(500)
			end
			return true
		end
	end
end


-- 根据角色需要买不同的物品
function BuyItemJudgeUsers()
	PushDebugMessage("#eDC4C18#cFFFF00 #81购买百宝阁开始")
	 -- 开始购买
	--  --此生的回矇 雨林之后 红颜傲﹡． しF笑天Dす ぁ壹葉醬油あ  
	--获取当前用户名称，判断是否需要买令牌相关物品
	local PlayerName = GetPlayerInfo("NAME")
	--Players1表示令牌物品全不要买
	--[[local Players1 = {"逗逗．や","情定三世丶"};--]]
	--Players2表示令牌物品全要买
	local Players2 = {"梵魚ˇ ","平凡の","．波少ヽ","丶漫步ゾ天龙","TH－莫囄"};
	--Players3表示令牌买唤灵液
	local Players3 = {"′雪走","°﹎紫龍ヤ"};
	--Players4表示令牌买天荒晶石
	local Players4 = {"灬枫ヽ昕℃ ","小叶丶绝杀","Se⒎蕝蝂哥℡","しF笑天Dす","╰☆TeaR陌ゝ","超级↑→奶妈","Am°惜你若命","．Lynthia","轻狂∴小可","雨林之后","红颜傲﹡．"};
	
	--Players2表示令牌物品全要买
	for key,value in ipairs(Players2) do
		if PlayerName == Players2[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81买唤灵液【升级令牌】#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)
			end
			
			PushDebugMessage("#eDC4C18#cFFFF00 #81天荒晶石【洗令牌】#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(2);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)	
			end
		end
	end

	--Players3表示令牌买唤灵液
	for key,value in ipairs(Players3) do
		--PushDebugMessage(key,value)
		--PushDebugMessage(Players1[key])
		if PlayerName == Players3[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81买唤灵液【升级令牌】#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)
			end
		end
	end

	--Players4表示令牌买天荒晶石
	for key,value in ipairs(Players4) do
		--PushDebugMessage(key,value)
		--PushDebugMessage(Players1[key])
		if PlayerName == Players4[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81天荒晶石【洗令牌】#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(2);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)	
			end
		end
	end

end

-- 买其他物品
function buyOthers()
	for i = 3, 16 do
		if i == 1 or i == 2 or i == 5 or i == 9 or i == 10 then 
			break;
		else
			for j=1, 6 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(3);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(4);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(6);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(7);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(8);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(11);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(12);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(13);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(14);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(15);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(16);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
			end
		end
	end
end


checkNPCDst()
BuyItemJudgeUsers()
buyOthers()
GuildToCity(1)
执行脚本("[功能] 物品存仓")