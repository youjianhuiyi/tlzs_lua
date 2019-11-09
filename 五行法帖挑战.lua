------- 开始----------------------------------
输入屏幕文本("#eDC4C18#cFFFF00开始自动扫荡虚空")
local g_szItemName = AI_GetParameter("仓库取物")
	--参数1：需取出的物品名称 ，空格分开
	--参数2：取出的数量
	--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
	--参数4：整理背包 true 或 false 可空
	--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
local nCnt = Bank_GetItem(" 五行法帖 ", 31, 1)
-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
if MapName == "洛阳" then
	MoveToNPC(219,245,0,"黄云禅");Sleep(1000)
elseif MapName == "苏州" then
	MoveToNPC(200,334,1,"独孤悔");Sleep(1000)
elseif MapName == "大理" then
	MoveToNPC(206,56,2,"金忆风");Sleep(1000)
elseif MapName == "楼兰" then
	MoveToNPC(163,153,246,"金睿凡");Sleep(1000)
else
	执行脚本("[功能] 回城")
	MoveToNPC(219,245,0,"黄云禅");Sleep(1000)
end
QuestFrameOptionClicked("挑战虚空幻境",1); Sleep(1000)
for i = 0, 50 do
    GetLuaValue("setmetatable(_G, {__index = DanrenFB_Env});DanrenFB_SaoDang_Clicked();","",0)
	Sleep(500)
	PushDebugMessage("#eDC4C18#cFFFF00自动扫荡虚空结束")
end
执行脚本("销买存")