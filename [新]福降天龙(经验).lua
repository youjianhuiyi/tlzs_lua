function AutoExp()
    PushDebugMessage("#eDC4C18#cFFFF00�Զ��Ը�����������")
	GetLuaValue("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(9);","",0);Sleep(1000);--�򿪸�����������
	GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();","",0);Sleep(1000);--��� ����ť
	GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_Cancel_Clicked(1);","",0);Sleep(1000);--���ȷ����ť
	GetLuaValue("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();","",0);Sleep(1000);--���ȷ����ť
	GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_OnHiden();","",0);Sleep(1000);--����رհ�ť
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
findItem()