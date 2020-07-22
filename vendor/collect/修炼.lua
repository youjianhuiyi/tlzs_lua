PushDebugMessage("前往大理 扫地神僧 点修炼！")

--判断背包中的功力丹数量
local _, A, _ = FindBagItem(-1, "功力丹")
PushDebugMessage("当前背包中的功力丹数量" .. A)


--前往银行取功力丹、金币，默认仓库留5金
local nNeedMoney = -5 * 10000
PushDebugMessage("前往银行取钱，仓库留5金")
Bank_GetMoney(nNeedMoney);Sleep(1500)

--仓库取功力丹
local g_szItemName = " 功力丹 "
Bank_GetItem(g_szItemName, -1);Sleep(1500)

--判断仓库取出功力丹后背包里功力丹数量
local _, nCount, _ = FindBagItem(-1, "功力丹")
PushDebugMessage("你从仓库成功取出" .. nCount-A .. "个功力丹！")

--判断功力丹个数>=3个时，点修炼
if nCount >= 3 then
   PushDebugMessage("现在开始修炼")
   LoadScript("点修炼") 
 --使用 功力丹 点击修炼,循环执行3次
   for i = 1, 3 do
       UseItem(0,"功力丹");Sleep(1000)
   --各种确定 跨图寻路确定、销毁物品确定等...
       MessageBox_Self_OK_Clicked();Sleep(1000)
       PushDebugMessage("使用1个功力丹！")
       LoadScript("点修炼") 
   end
   PushDebugMessage("今日完成4次修炼！")
--判断1≤功力丹个数＜3时，点修炼
elseif  nCount < 3 and nCount > 0 then
   PushDebugMessage("现在开始修炼")
   LoadScript("点修炼") 
 --使用 功力丹 点击修炼，循环执行 nCount 次
   for i = 1, nCount do
       UseItem(0,"功力丹");Sleep(1000)
       --各种确定 跨图寻路确定、销毁物品确定等...
       MessageBox_Self_OK_Clicked();Sleep(1000)
       PushDebugMessage("使用1个功力丹！")
       LoadScript("点修炼") 
   end
   PushDebugMessage("今日完成" .. nCount+1 .."次修炼！")

else
   PushDebugMessage("现在开始修炼")
   LoadScript("点修炼") 
   PushDebugMessage("今日完成1次修炼！")
end


--存物品和金币
PushDebugMessage("将背包里的功力丹、金币存至仓库...")

local g_szItemName, g_bNoSaveMoney = "功力丹"
-- 判断背包是否有需要存仓的物品
if not FindBagItem(-2, g_szItemName) then
    PushDebugMessage("当前背包中没有要存仓的功力丹！")
  -- 这里可以修改包内留下多少铜
    local nTong = 0
    Bank_SaveMoney(nTong)   
else
   -- 存仓：参数1前后都加一个空格 物品名称以空格分开
   -- 参数2是否存钱 true 或 false
   local _, nCount, _ = FindBagItem(-1, "功力丹")         
   Bank_SaveItem(g_szItemName, g_bNoSaveMoney)
   PushDebugMessage("你成功存入仓库" .. nCount .. "个功力丹！") 
end
