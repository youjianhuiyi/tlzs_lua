function checkNPCDst()
    local Obj = Enum2XAllObj()
    --�������͡� ����2�����δ��� {NPC,�����ң����ޣ�����} 0�ų���1������
    tObj = ObjFilterByClass(tObj, {1, 0, 0, 0, 0})
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "������" and tonumber(tmp.dst) <= 3 then
			return true
		else
            MoveToNPC(109,121,246,"������");Sleep(50)
		end
    end
    return false
end


function buyPetEats()
    MoveToNPC(109,121,246,"������");Sleep(500)
    QuestFrameOptionClicked("���������Ķ���");Sleep(500)
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

local DropCommonItem = {"���������","�ȳ����","��鵿���"}

function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("������Ʒ���ƣ� [" .. value.."]");
			-- �ȴ�(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
	
end

--���ĵ���
checkNPCDst()
buyPetEats()

--����������6�Σ���Ʒ��д������
--���5��������һ��
for i = 1,2 do
	destroyItem();
end
