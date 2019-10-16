function checkNPCDst()
    local Obj = Enum2XAllObj()
    --过滤类型。 参数2：依次代表 {NPC,怪物，玩家，珍兽，宝箱} 0排除，1保留，
    tObj = ObjFilterByClass(tObj, {1, 0, 0, 0, 0})
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "云兮兮" and tonumber(tmp.dst) <= 3 then
			return true
		else
            MoveToNPC(109,121,246,"云兮兮");Sleep(50)
		end
    end
    return false
end


function buyPetEats()
    MoveToNPC(109,121,246,"云兮兮");Sleep(500)
    QuestFrameOptionClicked("看看你卖的东西");Sleep(500)
    输入屏幕文本("#eDC4C18#cFFFF00买指定数量的肉与快乐度物品，准备刷新副本")
    for i = 1,2 do
        --下一页
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_PageDown();","",0);Sleep(500);
        --批量购买
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);Sleep(500);
        --买后腿肉
        GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(6);","",0);Sleep(500);
        --买两次
        GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);Sleep(500);
    end
    --上一页
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_PageUp();","",0);Sleep(500);
    --批量购买
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);Sleep(500);
    --买后腿肉
    GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(4);","",0);Sleep(500);
    --买最大
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);Sleep(500);
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);Sleep(200)
    GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);Sleep(500);
    PushDebugMessage("买肉结束，准备开刷")
end

local DropCommonItem = {"后肘肉口粮","蝗虫口粮","棕榈口粮"}

function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("销毁物品名称： [" .. value.."]");
			-- 等待(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
	
end

--核心调用
checkNPCDst()
buyPetEats()

--下面是销毁6次，物品名写在下面
--大概5秒钟销毁一次
for i = 1,2 do
	destroyItem();
end
