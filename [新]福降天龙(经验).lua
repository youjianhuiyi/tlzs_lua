function AutoExp()
    PushDebugMessage("#eDC4C18#cFFFF00自动吃福降天龙经验")
	GetLuaValue("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(9);","",0);Sleep(1000);--打开福降天龙界面
	GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();","",0);Sleep(1000);--点击 祈福按钮
	GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_Cancel_Clicked(1);","",0);Sleep(1000);--点击确定按钮
	GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();","",0);Sleep(1000);--点击确定按钮
	GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_OnHiden();","",0);Sleep(1000);--点击关闭按钮
end


function findItem()
	while true do
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

--核心调用
findItem()