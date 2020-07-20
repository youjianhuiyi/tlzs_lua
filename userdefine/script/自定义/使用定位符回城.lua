--下坐骑
Dismount()
Sleep(1000)
while true do
	--使用道具栏物品
	--	返回值：2个(逻辑型 整数型) 是否使用 位置索引
	--  参数1：文本型		物品名称，支持多个物品，空格隔开
	--  参数2：整数型		0无所谓 1不绑的 2绑定的
	local bUse, nIndex = Bag:UseBagItem_DJ("紫色定位符", 0)
	Sleep(1000)
	if bUse then 
		break
	end
end