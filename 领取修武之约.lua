function AutoGet()
    PushDebugMessage("#eDC4C18#cFFFF00 �Զ���ȡ����֮Լ")
	GetLuaValue("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(15);","",0);Sleep(1000);--��ǩ������
	GetLuaValue("setmetatable(_G, {__index = Fuli_MonthlySign_Env});Fuli_MonthlySign_Button10_Click();","",0);Sleep(1000);--����л�������֮Լ
	for i = 1 ,10 do
		GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(".. i ..",0)","",0);Sleep(1000);--�����ȡ
	end
end


function findItem()
	while true do
		local bFind, nIndex = Bag:FindBagItem_DJ("������",0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("������Ʒ���ƣ� [������]");
			AutoExp()
			Sleep(10);
		else
			break
		end 
	end
	return false;
end

--���ĵ���
AutoGet()