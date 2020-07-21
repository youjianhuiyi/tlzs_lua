--[[
    脚本功能：自动使用福降天龙经验牌，目前有一个 BUG，就是如果角色经验满了，就无法使用，所以需要先去点一下心法或者修炼 
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


-----------------------------------------------------------
-- 自动使用
-----------------------------------------------------------
function AutoExp()
	PushDebugMessage("#eDC4C18#cFFFF00 自动吃福降天龙经验")
	for i=1,3 do
		GetLuaValue("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(9);","",0);Sleep(1000);--打开福降天龙界面
		GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();","",0);Sleep(1000);--点击 祈福按钮
		GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_Cancel_Clicked(1);","",0);Sleep(1000);--点击确定按钮
		GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();","",0);Sleep(1000);--点击确定按钮
		GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_OnHiden();","",0);Sleep(1000);--点击关闭按钮
	end
end


-----------------------------------------------------------
-- 仓库取金币
-----------------------------------------------------------
function findItem()
	for i = 1,5 do
		local bFind, nIndex = Bag:FindBagItem_DJ("福降令",0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("查找物品名称： [福降令]");
			AutoExp()
			Sleep(10);
		else
			break
		end 
	end
	return false;
end


-----------------------------------------------------------
-- 核心调用
-----------------------------------------------------------
findItem()