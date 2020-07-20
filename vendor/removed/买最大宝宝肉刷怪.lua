--GetLuaValue() 这个是个万能接口，能实现很多功能，不会用的话请关注【其他脚本.lua】有简单例子
--local 返回值1,返回值2,返回值n = GetLuaValue("游戏的lua字串","返回值类型",返回值个数)    
 --   类型 "s"  文本型
 --   类型 "n"  整数型
 --   "sns" 表示3个返回值，第一个文本型，第二个整数型，第三个文本型。对应返回值个数填3
-----开始----------------------
PushDebugMessage("开始进行刷怪前的买肉准备，买满一背包肉开始刷怪")
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
if MapName == "洛阳" then
	MoveToNPC(275, 295, 0,"云渺渺");Sleep(500)
elseif MapName == "苏州" then
	MoveToNPC(171,238,1,"云霏霏");Sleep(500)
elseif MapName == "大理" then
	MoveToNPC(271,133,2,"云飘飘");Sleep(500)
elseif MapName == "楼兰" then
	MoveToNPC(109,121,246,"云兮兮");Sleep(500)
else
	执行脚本("[功能] 回城")
	MoveToNPC(275, 295, 0,"云渺渺");Sleep(500)
end
QuestFrameOptionClicked("购买珍兽物品",1); Sleep(500)
--批量购买
GetLuaValue("setmetatable(_G, {__index = Shop_Env});Booth_BuyMult();","",0);
Sleep(500);
--买后腿肉
GetLuaValue("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(4);","",0);
Sleep(500);
--买最大值 
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);
Sleep(500);
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Max_Ex_Clicked();","",0);
Sleep(200)
GetLuaValue("setmetatable(_G, {__index = Shop_BulkBuyingEx_Env});Shop_BulkBuying_Accept_Ex_Clicked();","",0);
Sleep(500);
PushDebugMessage("买肉结束，准备开刷")