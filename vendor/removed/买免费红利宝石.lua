PushDebugMessage("��ʼ�Զ���ÿ����ѱ�ʯ")
--GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent('TOGGLE_YUANBAOSHOP');","",0);
--��Ԫ���̳�
GetLuaValue("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();","",0);
Sleep(500);
--�򿪺����̵�
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);","",0);
Sleep(500);
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);","",0);
Sleep(500);
---��һҳ
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();","",0);
Sleep(500);
--��ƾ�3 ����4 �쾧5 �̾�6
--�����Ļز� ����֮�� ���հ��~�� ��FЦ��D�� ��Ҽ�~�u�ͤ�  
--��ȡ��ǰ�û����ƣ��ж��Ƿ���Ҫ�����������Ʒ
local PlayerName = GetPlayerInfo("NAME")
--Players1��ʾ��ƾ�ʯ
local Players1 = {"���ڽ�ӵ���f","�鶨����ؼ","���c꿡�","���հ��~��"};
--Players2��ʾ������ʯ
local Players2 = {"���~��","��Ҽ�~�u�ͤ�"};
--Players3��ʾ��쾧ʯ
local Players3 = {"��������","�����Ļز�","��FЦ��D��"};
--Players4��ʾ���̾�ʯ
local Players4 = {"��������","","����֮��"};

--Players1��ʾ��ƾ�ʯ
for key,value in ipairs(Players1) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81��ƾ�ʯ#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);","",0);
			Sleep(500)
		end
	end
end
--Players2��ʾ������ʯ
for key,value in ipairs(Players2) do
	if PlayerName == Players2[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81������ʯ#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);","",0);
			Sleep(500)
		end
	end
end
--Players1��ʾ��쾧ʯ
for key,value in ipairs(Players3) do
	if PlayerName == Players3[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81��쾧ʯ#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);","",0);
			Sleep(500)
		end
	end
end
--Players1��ʾ���̾�ʯ
for key,value in ipairs(Players4) do
	if PlayerName == Players4[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81���̾�ʯ#81")
		for i = 1, 2 do
			GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);","",0);
			Sleep(500)
		end
	end
end

--�ر�Ԫ���̳�
GetLuaValue("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();","",0);
Sleep(500);
--[[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();--�ر�Ԫ���̳�
setmetatable(_G, {__index = YuanbaoShop_Env});YuanBao_OnHiden();
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("OPEN_LIJINSHOP");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("UPDATE_BOOTH");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);--�򿪺����̵�
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();---��һҳ
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);--��쾧ʯ
setmetatable(_G, {__index = Packet_Env});this:Hide();--�رձ���
setmetatable(_G, {__index = Packet_Env});Packet_CloseFunction();--�رձ���
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnEvent("PACKET_OPENED");--�򿪱���
setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();--��Ԫ����
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("TOGGLE_YUANBAOSHOP");--��Ԫ����
setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();--������

--]]