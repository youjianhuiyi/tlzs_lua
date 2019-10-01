--MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
local items = " 玄天寒玉 ";
local g_szItemName = AI_GetParameter("仓库取物")
--参数1：需取出的物品名称 ，空格分开
--参数2：取出的数量
--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
--参数4：整理背包 true 或 false 可空
--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
local nCnt = Bank_GetItem(items,1000,1,true)
MoveToNPC(187,225,246,"史嫂", nil, true)
Sleep(600)
QuestFrameOptionClicked("寒玉合成", 1, 500)
Sleep(600)

while true do
	QuestFrameOptionClicked("我要合成", 1, 500)
	Sleep(100)
	--获取背包物品数量
	--	返回值：整数型
	--  参数1：文本型		物品名称，只支持精确名字
	--  参数2：整数型		绑定状态 0无所谓 1不绑的 2绑定的
	--  参数3：整数型		锁定状态 0无所谓 1不锁的 2锁定的
	local nCount = Bag:GetItemCount("玄天寒玉", 1, 1)
	if nCount < 5 then
		PushDebugMessage("#b#eff00ff身上玄天寒玉不足5个，结束合成！")
		break
	end
end