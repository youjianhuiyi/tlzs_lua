--执行脚本("[新]自动畅游加");Sleep(1000)
local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 真元珀 神兵符3级 圣兽鳞 金蚕丝 回天神石 灵兽精魄 忆魂石 灵兽丹·合（1级） 灵兽丹·风（1级） 灵兽丹·咒（1级） 灵兽丹·震（1级） 润魂石·击（1级） 润魂石·破（1级） 润魂石·暴（1级） 润魂石·御（1级） 真元精珀 千淬神玉 百淬神玉 神亦石 功力丹 五行法帖 浴火石 特殊物品 ",31,1);
PushDebugMessage("#b#eff00ff直接去钱庄了")
MoveToNPC(303,314,0,"金六爷");Sleep(1500)
--对话框 点击选项 0是模糊匹配，1是精确匹配
QuestFrameOptionClicked("前往钱庄总部",0);Sleep(1000)
MoveToNPC(61,29,224,"孙聚财");Sleep(1500)
QuestFrameOptionClicked("管理我出售的商品",0);Sleep(1000)