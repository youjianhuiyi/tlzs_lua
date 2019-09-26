function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "云渺渺" and tonumber(tmp.dst) <= 3 then
			return true
		else
            MoveToNPC(275,295,LUOYANG_ID,"云渺渺");Sleep(1000)
		end
    end
    return false
end


function buyPetEats()
    MoveToNPC(275,295,LUOYANG_ID,"云渺渺");Sleep(1000)
    QuestFrameOptionClicked("购买珍兽用品");Sleep(1000)
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

--核心调用
while true do
    checkNPCDst()
    buyPetEats()
    --获取背包物品数量
    --	返回值：整数型
    --  参数1：文本型		物品名称，只支持精确名字
    --  参数2：整数型		绑定状态 0无所谓 1不绑的 2绑定的
    --  参数3：整数型		锁定状态 0无所谓 1不锁的 2锁定的
    local nCount = Bag:GetItemCount("回旋金球", 0, 0)
    if nCount >= 40 then
        break;
    end
end