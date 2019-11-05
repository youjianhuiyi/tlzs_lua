function AutoGet()
    PushDebugMessage("#eDC4C18#cFFFF00 自动领取修武之约")
	GetLuaValue("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(15);","",0);Sleep(1000);--打开签到界面
	GetLuaValue("setmetatable(_G, {__index = Fuli_MonthlySign_Env});Fuli_MonthlySign_Button10_Click();","",0);Sleep(1000);--点击切换到修武之约
	for i = 1 ,10 do
		GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(".. i ..",0)","",0);Sleep(1000);--点击领取
	end
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
AutoGet()