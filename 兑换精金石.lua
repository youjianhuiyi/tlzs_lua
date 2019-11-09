PushDebugMessage("#eDC4C18#cFFFF00 远程兑换精金石")
------- 开始----------------------------------
输入屏幕文本("#eDC4C18#cFFFF00开始自动扫荡虚空")
local g_szItemName = AI_GetParameter("仓库取物")
	--参数1：需取出的物品名称 ，空格分开
	--参数2：取出的数量
	--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
	--参数4：整理背包 true 或 false 可空
	--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
local nCnt = Bank_GetItem(" 精金石碎片 ", 31, 1)
GetLuaValue("Clear_XSCRIPT();Set_XSCRIPT_Function_Name('DuiHuanOK');Set_XSCRIPT_ScriptID(890174);Set_XSCRIPT_ParamCount(0);Send_XSCRIPT();","",0)	