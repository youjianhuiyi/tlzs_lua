PushDebugMessage("#eDC4C18#cFFFF00 #81自动销毁宝宝和球,在脚本结束前，不允许整理背包，不然会误销毁！！！！！");
DropCommonItem = {"后肘肉口粮","回旋金球","蝗虫口粮","棕榈口粮"}

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
--下面是销毁6次，物品名写在下面
--大概5秒钟销毁一次
for i = 1,20 do
	destroyItem();
end
