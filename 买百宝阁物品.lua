-------����ٱ��� ��ʼ----------------------
local MapName = GetActiveSceneName()
PushDebugMessage(MapName)
--�жϽ�ɫ��ǰ���ڵ�ͼ���ͽ���ȡ����
if MapName == "����" then
	MoveToNPC(237,236,0,"������");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(322,264,1,"������");Sleep(1000)
elseif MapName == "����" then
	MoveToNPC(179,121,2,"������");Sleep(1000)
elseif MapName == "¥��" then
	MoveToNPC(191,130,246,"�����v");Sleep(1000)
else
	ִ�нű�("[����] �س�")
	MoveToNPC(237,236,0,"������");Sleep(1000)
end

-- �ж��Ƿ񵽴�NPC����
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "��ر�" and tonumber(tmp.dst) <= 3 then
			return true
		else
			if CityToGuild() then
				MoveToNPC(149, 44, -1, "��ر�"); Sleep(100)
				QuestFrameOptionClicked("����ٱ�����Ʒ",1); Sleep(500)
			end
			return true
		end
	end
end


-- ���ݽ�ɫ��Ҫ��ͬ����Ʒ
function BuyItemJudgeUsers()
	PushDebugMessage("#eDC4C18#cFFFF00 #81����ٱ���ʼ")
	 -- ��ʼ����
	--  --�����Ļز� ����֮�� ���հ��~�� ��FЦ��D�� ��Ҽ�~�u�ͤ�  
	--��ȡ��ǰ�û����ƣ��ж��Ƿ���Ҫ�����������Ʒ
	local PlayerName = GetPlayerInfo("NAME")
	--Players1��ʾ������Ʒȫ��Ҫ��
	--[[local Players1 = {"��������","�鶨����ؼ"};--]]
	--Players2��ʾ������ƷȫҪ��
	local Players2 = {"���~�� ","ƽ����","�����٩c","ؼ����������","TH��Ī��"};
	--Players3��ʾ��������Һ
	local Players3 = {"��ѩ��","��m������"};
	--Players4��ʾ��������ľ�ʯ
	local Players4 = {"���c꿡� ","СҶؼ��ɱ","Se��ʅ�Z��Y","��FЦ��D��","�t��TeaRİ�f","������������","Am��ϧ������","��Lynthia","����С��","����֮��","���հ��~��"};
	
	--Players2��ʾ������ƷȫҪ��
	for key,value in ipairs(Players2) do
		if PlayerName == Players2[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81����Һ���������ơ�#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)
			end
			
			PushDebugMessage("#eDC4C18#cFFFF00 #81��ľ�ʯ��ϴ���ơ�#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(2);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)	
			end
		end
	end

	--Players3��ʾ��������Һ
	for key,value in ipairs(Players3) do
		--PushDebugMessage(key,value)
		--PushDebugMessage(Players1[key])
		if PlayerName == Players3[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81����Һ���������ơ�#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)
			end
		end
	end

	--Players4��ʾ��������ľ�ʯ
	for key,value in ipairs(Players4) do
		--PushDebugMessage(key,value)
		--PushDebugMessage(Players1[key])
		if PlayerName == Players4[key] then
			PushDebugMessage("#eDC4C18#cFFFF00 #81��ľ�ʯ��ϴ���ơ�#81")
			for i = 1, 15 do
				GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(2);","",0);
				Sleep(1000)
				MessageBox_Self_OK_Clicked()
				Sleep(1000)	
			end
		end
	end

end

-- ��������Ʒ
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
ִ�нű�("[����] ��Ʒ���")