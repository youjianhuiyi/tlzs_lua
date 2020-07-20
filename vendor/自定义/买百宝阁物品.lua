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

PushDebugMessage("#eDC4C18#cFFFF00 #81购买百宝阁开始")
if CityToGuild() then
    MoveToNPC(149, 44, -1, "万藏宝"); Sleep(100)
    QuestFrameOptionClicked("购买百宝阁商品",1); Sleep(500)
    -- 开始购买
--  --此生的回矇 雨林之后 红颜傲﹡． しF笑天Dす ぁ壹葉醬油あ  
--获取当前用户名称，判断是否需要买令牌相关物品
local PlayerName = GetPlayerInfo("NAME")
--Players1表示令牌物品全不要买
--[[local Players1 = {"逗逗．や","情定三世丶"};--]]
--Players2表示令牌物品全要买
local Players2 = {"梵魚ˇ ","﹎素颜．や","平凡の","．波少ヽ","丶漫步ゾ天龙","Se⒎蕝蝂哥℡","°﹎紫龍ヤ","TH－莫囄"};
--Players3表示令牌买唤灵液
local Players3 = {"′雪走"};
--Players4表示令牌买天荒晶石
local Players4 = {"灬枫ヽ昕℃ ","しF笑天Dす"," °凌筱雨．≈","╰☆TeaR陌ゝ","超级↑→奶妈","Am°惜你若命","ら﹏笨呆呆°","天子月"};
--[[
for key,value in ipairs(Players1) do
	--PushDebugMessage(key,value)
	--PushDebugMessage(Players1[key])
	if PlayerName == Players1[key] then

	end
end--]]

--Players2表示令牌物品全要买
for key,value in ipairs(Players2) do
	if PlayerName == Players2[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81买唤灵液【升级令牌】#81")
		for i = 1, 10 do
			GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);
			Sleep(1000)
			MessageBox_Self_OK_Clicked()
			Sleep(1000)
		end
		
		PushDebugMessage("#eDC4C18#cFFFF00 #81天荒晶石【洗令牌】#81")
		for i = 1, 10 do
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
		for i = 1, 10 do
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
		for i = 1, 10 do
			GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(2);","",0);
			Sleep(1000)
			MessageBox_Self_OK_Clicked()
			Sleep(1000)	
		end
	end
end

PushDebugMessage("#eDC4C18#cFFFF00 #81天灵丹#81")
for i = 1, 6 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(3);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end

PushDebugMessage("#eDC4C18#cFFFF00 #81功力丹#81")
for i = 1, 3 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(4);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end

PushDebugMessage("#eDC4C18#cFFFF00 #81回天神石#81")
for i = 1, 3 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(6);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end

PushDebugMessage("#eDC4C18#cFFFF00 #81百淬神玉#81")
for i = 1, 6 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(7);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end

PushDebugMessage("#eDC4C18#cFFFF00 #81金刚砂#81")
for i = 1, 3 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(8);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end

PushDebugMessage("#eDC4C18#cFFFF00 #81真元珀#81")
for i = 1, 2 do
    GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(11);","",0);
    Sleep(1000)
    MessageBox_Self_OK_Clicked()
end
PushDebugMessage("#eDC4C18#cFFFF00 #813级棉布#81")
GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(12);","",0);
Sleep(1000)
MessageBox_Self_OK_Clicked()

PushDebugMessage("#eDC4C18#cFFFF00 #813级秘银#81")
GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(13);","",0);
Sleep(1000)
MessageBox_Self_OK_Clicked()
PushDebugMessage("#eDC4C18#cFFFF00 #81典籍注解#81")
GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(14);","",0);
Sleep(1000)
MessageBox_Self_OK_Clicked()
PushDebugMessage("#eDC4C18#cFFFF00 #81悟灵珠#81")
GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(15);","",0);
Sleep(1000)
MessageBox_Self_OK_Clicked()MessageBox_Self_OK_Clicked()
PushDebugMessage("#eDC4C18#cFFFF00 #81紫府星髓#81")
for i=1,6 do
	GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(16);","",0);
	Sleep(1000)
	MessageBox_Self_OK_Clicked()
end 
GuildToCity(2)
执行脚本("[功能] 物品存仓")
end