function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "������" and tonumber(tmp.dst) <= 3 then
			return true
		else
            MoveToNPC(275,295,LUOYANG_ID,"������");Sleep(1000)
		end
    end
    return false
end


function buyPetEats()
    MoveToNPC(275,295,LUOYANG_ID,"������");Sleep(1000)
    QuestFrameOptionClicked("����������Ʒ");Sleep(1000)
    ������Ļ�ı�("#eDC4C18#cFFFF00��ָ��������������ֶ���Ʒ��׼��ˢ�¸���")
    for i = 1,2 do
        --��һҳ
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_PageDown();","",0);Sleep(500);
        --��������
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);Sleep(500);
        --�������
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(6);","",0);Sleep(500);
        --������
        GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);Sleep(500);
    end
    --��һҳ
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_PageUp();","",0);Sleep(500);
    --��������
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);Sleep(500);
    --�������
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(4);","",0);Sleep(500);
    --�����
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);Sleep(500);
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);Sleep(200)
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);Sleep(500);
    PushDebugMessage("���������׼����ˢ")
end

--���ĵ���
checkNPCDst()
buyPetEats()