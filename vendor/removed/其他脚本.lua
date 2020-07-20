--请自行新建一个lua文件，把需要的功能复制到新建的文件、修改、保存后运行
--请不要修改这里，以防以后更新被覆盖，导致丢失


-------修炼 开始--------------------------------------------------------------------------------------------------------
--TalkNpc("扫地神僧")
MoveToNPC(241,31,2,"扫地神僧");Sleep(1000)
QuestFrameOptionClicked("修炼",1);Sleep(1000)

--秘籍 技能 需要自己改
local miji = 1
local jineng = 1

--点击秘籍
GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Xinfa_Clicked(%d)",miji),"",0);Sleep(800)
--点击技能
GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Skill_Clicked(%d)",jineng),"",0);Sleep(800)
--点击学习
GetLuaValue("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_UpLevel_Clicked()","",0);Sleep(500)

--重复复制上面的命令，达到修炼多次的目的

---------修炼 结束------------------------------------------------------------------------------------------------------








-------领取大区赛每周奖励 开始--------------------------------------------------------------------------------------------------------

--MoveToNPC(236,236,0,"范纯仁");Sleep(1500)
--QuestFrameOptionClicked("进入本帮城市");Sleep(3000)

if CityToGuild() then
    MoveToNPC(94, 54, -1, "赵子勋"); Sleep(1500)
    QuestFrameOptionClicked("领取大区赛每周奖励",1); Sleep(1500)
    -- 领取奖励
    GetLuaValue("setmetatable(_G, {__index=Bhls_Prize_Env});Bhls_Prize_Ok_Clicked();", "", 0); Sleep(1500)
end

-------领取大区赛每周奖励 结束-------------------------------------------------------------------------------------------------------------------------







-------仓库取出物品 开始-------------------------------------------------------------------------------------------------------------------------

--先获取要取出的物品，可自己设置
local g_szItemName = AI_GetParameter("仓库取物")

--参数1是物品名称以空格分开，参数2是取出的数量，参数3是否绑定填0或1或2 0不限制绑定与否
--参数1前后都加一个空格
Bank_GetItem(g_szItemName,-1)

--local nCnt = Bank_GetItem(" 子女装备 五行法帖 ", 31,0)
--MessageBox(nCnt)
-------仓库取出物品 结束-------------------------------------------------------------------------------------------------------------------------







-------存仓 开始-------------------------------------------------------------------------------------------------------------------------
PushDebugMessage("将存仓页面设置的存仓物品存至仓库...")

local g_szItemName, g_bNoSaveMoney = AI_GetParameter("存仓物品")
if g_szItemName == "" then
    PushDebugMessage("【物品存仓】：你没有设置任何存仓物品名称！")
    --  
end
-- 判断背包是否有需要存仓的物品
if not FindBagItem(-2, g_szItemName) then
    PushDebugMessage("【物品存仓】：当前背包中没有要存仓的物品！")   
else
   -- 存仓：参数1前后都加一个空格 物品名称以空格分开
   -- 参数2是否存钱 true 或 false
    Bank_SaveItem(g_szItemName, g_bNoSaveMoney) 
end

-------存仓 结束-------------------------------------------------------------------------------------------------------------------------