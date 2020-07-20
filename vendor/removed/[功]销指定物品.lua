function 查找背包物品(commonItem)
	num = {};
	for i=0,60 do
		local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1)
		if nId~=0 then
			local sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1)
			if sName==commonItem then
				for a=0,i-1 do
					num[a] = i-1;
				end
			end
		end
	end
	
	for key,value in ipairs(num) do
		CallFun(5,value);
	end
end
--下面是销毁6次，物品名写在下面
--大概5秒钟销毁一次
for  i=0,6 do
	查找背包物品("后肘肉口粮")
	查找背包物品("回旋金球")
	查找背包物品("蝗虫口粮")
end

