--[[
    脚本功能：老板号接收交易物品，必须设置好老板号
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local items = " 龙纹玉灵 棉布碎片 秘银碎片 高级药材 珍兽蛋 中级药材 缀龙石·元 缀龙石·伤 缀龙石·暴 技能书 玉龙髓 净云水 铸纹血玉 玉华灵泉 释灵浆 ";
LoadScript("allPlayers.lua")

function main()
	-- 第一步,先销毁背包里面的宝宝肉
	LoadScript("[功]销指定物品")
	-- 第二步，先取出天机锦囊里面的所有需要取出的物品
	LoadScript("锦囊取物")
	-- 第三步，将取出来的物品存仓一次
	LoadScript("[功能] 物品存仓")
	-- 第四步，将取出来的物品存仓一次
	LoadScript("加工材料")
	local g_szItemName = AI_GetParameter("仓库取物")
	--参数1：需取出的物品名称 ，空格分开
	--参数2：取出的数量
	--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
	--参数4：整理背包 true 或 false 可空
	--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
	local nCnt = Bank_GetItem(items, 31, 1, true)
	for i = 1 , 4 do
		LoadScript("交易给老板号");Sleep(100);
	end
end
-- 执行主控
main()
-- 完成之后执行买卖补给
MoveToNPC(343,246,1,"梁伙计");Sleep(1000)