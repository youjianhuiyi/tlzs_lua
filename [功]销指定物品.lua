PushDebugMessage("#eDC4C18#cFFFF00 #81自动销毁宝宝和球,在脚本结束前，不允许整理背包，不然会误销毁！！！！！");
local DropCommonItem = {"后肘肉口粮","回旋金球","蝗虫口粮","棕榈口粮","初级勾天彩合成符","高级宝石熔炼符","足太阴脉运功典藏"}
local OverNumsItems = {"战魂玉","古兰玉","愿灵泉","新莽神符7级"}

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

-- 超出指定数量的物品销毁，战魂玉，缥缈玄符，古兰玉，愿灵泉等
function overNumsItem()
	for key,value in ipairs(OverNumsItems) do
		--遍历道具栏材料栏所有物品
		--返回值：物品数组
		local tObj = Bag:EnumAllObj()
		for i = 1, #tObj do
			local tmp = tObj[i]
			if tmp.name == value and tmp.count >= 250 then 
				CallFun(5,tmp.index)
			end
		end
	end
end

-- 获取背包肉数量与剩余空间数量 
function getBagNum()
	--获取背包物品数量
	--	返回值：整数型
	--  参数1：文本型		物品名称，只支持精确名字
	--  参数2：整数型		绑定状态 0无所谓 1不绑的 2绑定的
	--  参数3：整数型		锁定状态 0无所谓 1不锁的 2锁定的
	local nCount = Bag:GetItemCount("后肘肉口粮", 0, 1)

end

-- 销毁指定数量的物品一个格子
overNumsItem()
--下面是销毁6次，物品名写在下面
--大概5秒钟销毁一次
for i = 1,20 do
	destroyItem();
end
