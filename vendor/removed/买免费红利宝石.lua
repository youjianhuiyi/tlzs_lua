PushDebugMessage("开始自动买每周免费宝石")
--GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent('TOGGLE_YUANBAOSHOP');","",0);
--打开元宝商城
GetLuaValue("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();","",0);
Sleep(500);
--打开红利商店
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);","",0);
Sleep(500);
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);","",0);
Sleep(500);
---下一页
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();","",0);
Sleep(500);
--买黄晶3 蓝晶4 红晶5 绿晶6
--此生的回矇 雨林之后 红颜傲﹡． しF笑天Dす ぁ壹葉醬油あ  
--获取当前用户名称，判断是否需要买令牌相关物品
local PlayerName = GetPlayerInfo("NAME")
--Players1表示买黄晶石
local Players1 = {"″踮脚拥他ゝ","情定三世丶","灬枫ヽ昕℃","红颜傲﹡．"};
--Players2表示买蓝晶石
local Players2 = {"梵魚ˇ","ぁ壹葉醬油あ"};
--Players3表示买红晶石
local Players3 = {"逗逗．や","此生的回矇","しF笑天Dす"};
--Players4表示买绿晶石
local Players4 = {"豆豆妈咪","","雨林之后"};

--Players1表示买黄晶石
for key,value in ipairs(Players1) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81买黄晶石#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);","",0);
			Sleep(500)
		end
	end
end
--Players2表示买蓝晶石
for key,value in ipairs(Players2) do
	if PlayerName == Players2[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81买蓝晶石#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);","",0);
			Sleep(500)
		end
	end
end
--Players1表示买红晶石
for key,value in ipairs(Players3) do
	if PlayerName == Players3[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81买红晶石#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);","",0);
			Sleep(500)
		end
	end
end
--Players1表示买绿晶石
for key,value in ipairs(Players4) do
	if PlayerName == Players4[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81买绿晶石#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);","",0);
			Sleep(500)
		end
	end
end

--关闭元宝商城
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();","",0);
Sleep(500);
--[[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();--关闭元宝商城
setmetatable(_G, {__index = YuanbaoShop_Env});YuanBao_OnHiden();
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("OPEN_LIJINSHOP");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("UPDATE_BOOTH");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);--打开红利商店
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();---下一页
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);--买红晶石
setmetatable(_G, {__index = Packet_Env});this:Hide();--关闭背包
setmetatable(_G, {__index = Packet_Env});Packet_CloseFunction();--关闭背包
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnEvent("PACKET_OPENED");--打开背包
setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();--打开元宝店
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("TOGGLE_YUANBAOSHOP");--打开元宝店
setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();--整理背包

--]]