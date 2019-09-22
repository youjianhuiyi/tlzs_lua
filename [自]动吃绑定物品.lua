PushDebugMessage("准备循环吃绑定物品")

for i = 1,10 do
	local bUse, nIndex = Bag:UseBagItem_DJ("真元珀 真元精珀 释灵浆 表情包：哞哞牛 表情包：蛋蛋 天力丹 大力丹 地力丹 小力丹", 2)
	Sleep(100)
end
