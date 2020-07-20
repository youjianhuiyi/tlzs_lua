PushDebugMessage("直接去钱庄了")
MoveToNPC(303,314,0,"金六爷");Sleep(1500)
--对话框 点击选项 0是模糊匹配，1是精确匹配
QuestFrameOptionClicked("前往钱庄总部",0);Sleep(1000)
MoveToNPC(61,29,224,"孙聚财");Sleep(1500)
QuestFrameOptionClicked("管理我出售的商品",0);Sleep(1000)