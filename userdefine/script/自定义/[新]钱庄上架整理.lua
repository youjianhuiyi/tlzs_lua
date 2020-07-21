--[[
    脚本功能：钱庄上架整理，自动取钱庄物品去钱庄集合交易
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
local YBItems = " 魂冰珠（1级） 真元珀 神兵符3级 圣兽鳞 金蚕丝 回天神石 灵兽精魄 忆魂石 灵兽丹·合（1级） 灵兽丹·风（1级） 灵兽丹·咒（1级） 灵兽丹·震（1级） 润魂石·击（1级） 润魂石·破（1级） 润魂石·暴（1级） 润魂石·御（1级） 真元精珀 千淬神玉 百淬神玉 神亦石 功力丹 五行法帖 浴火石 御·折冰属性书  御·禀火属性书  御·参玄属性书  御·疗毒属性书  击·寒冰属性书  击·炽焰属性书  击·苍玄属性书  击·创毒属性书  破·沉冰属性书  破·落炎属性书  破·释玄属性书  破·嗜毒属性书  暴·穿冰属性书  暴·暗火属性书  暴·冲玄属性书  暴·拔毒属性书 贝叶经残片 ";
-----------------------------------------------------------
-- 判断背包里面的脚本
-----------------------------------------------------------
function judgeBagIsEmpty()
    local tObj = Bag:EnumAllObj()
	local n = 0
	local m = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1
		end
	end
	return {bag1 = n,bag2 = m}
end


-----------------------------------------------------------
-- 销毁肉交任务，因为有时候是从定时出来的，防止卡
-----------------------------------------------------------
function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("#b#eff00ff 销毁物品名称： [" .. value.."]");
			-- 等待(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
end


-----------------------------------------------------------
-- 核心逻辑 
-----------------------------------------------------------
function _sMain()
    local bags = judgeBagIsEmpty();
    if bags[bag1] >20 or bags[bag2] > 20 then
        LoadScript("[功能] 买卖补给")
        LoadScript("加工材料")
        LoadScript("[功能] 物品存仓")
        for i=1,4 do
            destroyItem();
        end
    

        local g_szItemName = AI_GetParameter("仓库取物")
        --参数1：需取出的物品名称 ，空格分开
        --参数2：取出的数量
        --参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
        --参数4：整理背包 true 或 false 可空
        --参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
        local nCnt = Bank_GetItem(YBItems,31,1);
        PushDebugMessage("#b#eff00ff直接去钱庄了")
    end

    跨图寻路("钱庄",92,100)
end


-----------------------------------------------------------
-- 核心调用
-----------------------------------------------------------
_sMain()