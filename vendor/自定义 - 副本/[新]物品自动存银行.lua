-- @Author: yulinzhihou
-- @Date:   2018-10-04 23:27:35
-- @Last Modified by:   yulinzhihou
-- @Last Modified time: 2018-10-07 00:42:04
local BaseNum = 20; --[[背包初始化总格子数--]]
local TotalNum = 20;--[[当前角色有多少个格子--]]
local MaxNum = 30;--[[当前角色最大拥有的格子数--]]
-- 获取当前人物坐标
local xPos,yPos = Player_GetPos();
--[[检查背包道具栏里面是否有多余的一个空白空间--]]
function checkBaseBagEmptyNumbs()
    --通过获取当前背包的空余空间来取物品
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(10);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(10);
    local count = 0;
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1);Sleep(10);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1);Sleep(10);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(10);--[[获取当前道具栏总共有多少个格子--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(10);--[[获取当前道具栏总共有多少个格子--]]
            count = count + 1;
        end
    end
    local Rest_Nums = CurrNum - count;
    if Rest_Nums < 0 then
        PushDebugMessage("背包空间不够，请清理包之后再执行");
        return;
    end
end

--[[检查背包材料栏里面是否有多余的一个空白空间--]]
function checkMatBagEmptyNumbs()
    --通过获取当前背包的空余空间来取物品
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(10);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);","",0);Sleep(10);
    local count = 0;
    for i=30,59 do
        local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1);Sleep(10);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1);Sleep(10);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(10);--[[获取当前道具栏总共有多少个格子--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(10);--[[获取当前道具栏总共有多少个格子--]]
            count = count + 1;
        end
    end
    local Rest_Nums = CurrNum - count;
    if Rest_Nums < 0 then
        PushDebugMessage("背包空间不够，请清理包之后再执行");
        return;
    end
end

--[[取出最后一个空间的道具栏物品，默认是第1-6个格子里面的东西--]]
function getBaseItemsFromBank()
    for i=1,6 do
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item"..i..":DoAction();","",0);Sleep(400);
    end
end

--[[取出最后一个空间的材料栏物品，默认是第7-20个格子里面的东西--]]
function getMatItemsFromBank()
    for i=7,20 do
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_Item"..i..":DoAction();","",0);Sleep(400);
    end
end


--[[寻路去帮会银行NPC并打开最后一格空间--]]
function GotoNPC()
    if xPos ~= 148 and yPos ~= 56 then
        MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
        QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(5);","",0);Sleep(1000);
        -- getBaseItemsFromBank();
    else
        GetLuaValue("setmetatable(_G, {__index = Banghui_Bank_Env});Banghui_Bank_patulousBox_Clicked(5);","",0);Sleep(1000);
        -- getBaseItemsFromBank();
    end
end

--[[获取道具栏背包里面的物品--]]
function findBaseItemsToBank()
    --通过获取当前背包的空余空间来取物品
    GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",0);Sleep(1000);
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(0);","",0);Sleep(1000);
    for i=0,29 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1);Sleep(100);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1);Sleep(100);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(100);--[[获取当前道具栏总共有多少个格子--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(100);--[[获取当前道具栏总共有多少个格子--]]
        end
        -- 如果是里面的物品则取出来。前提是道具栏空间
        if sName == "低级宝石合成符" or sName == "宝石雕琢符3级" or sName == "释灵浆" or sName == "龙纹玉灵" or sName == "铸纹血玉" or sName == "九宫盒" then
            xPos = math.floor(i/5 + 1);
            yPos = i-((xPos-1)*5) + 1;
            -- PushDebugMessage("xPos："..xPos..";yPos："..yPos.."物品名称为："..sName);
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(100);--[[取出帮会银行第16个格子的物品。（当前在第几页，就取当前面的第16个格子的物品）--]]
        end
    end
end

--[[查找材料背包里面的物品--]]
function findMatItemsToBank()
    -- 打开背包道具栏
    GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);","",0);Sleep(1000);
    for i=30,59 do
        local nId = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetID();","n",1);Sleep(200);
        if nId~=0 then
            sName = GetLuaValue("local theAction = EnumAction("..i ..", 'packageitem');return theAction:GetName();","s",1);Sleep(200);
            CurrNum = GetLuaValue("return DataPool:GetBaseBag_Num();","n",1);Sleep(200);--[[获取当前道具栏总共有多少个格子--]]
            CurrNum_Mat = GetLuaValue("return DataPool:GetMatBag_Num();","n",1);Sleep(200);--[[获取当前道具栏总共有多少个格子--]]
        end
        --剩下多少空白的格子
        if sName=="秘银碎片" or sName=="棉布碎片" or sName=="精铁碎片" or sName=="麟木箭" or sName=="丹青" or sName=="彩虹之箭" or sName=="丝线3级" or sName=="染料3级" or sName=="缀龙石·元" or sName=="缀龙石·伤" or sName=="缀龙石·暴" or sName=="玉龙髓" or sName=="净云水" or sName=="玉华灵泉" then
            local new_i = i - 30;
            xPos = math.floor(new_i/5 + 1);
            yPos = new_i-((xPos-1)*5) + 1;
            GetLuaValue("setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked("..xPos..","..yPos..");","",0);Sleep(300);--[[取出帮会银行第16个格子的物品。（当前在第几页，就取当前面的第16个格子的物品）--]]
        end
    end
end

--[[等待队友完成整理--]]
function waitForFriends()
     playName = GetPlayerInfo("NAME");
     players = {
        {"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
        {"Se⒎蕝蝂哥℡","′梦影．","や ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
        {"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
        {"Eternally｀L","Eternally＇L","至若","","","小小书童2"},
        {"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
        -- {"豆豆妈咪","追逐ゝ","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
    };

    for i=1,5 do
        for j=1,6 do
            if playName == players[i][j] then
                time = (j-1)*120*1000;
                PushDebugMessage(players[i][j].."需要等待："..time/60000 .."分钟后运行");
                等待(time);
            end
        end
    end
end

function getItemsFromBagstoBH()
	PushDebugMessage("#eDC4C18#cFFFF00 进行仓库整理一套")
	执行脚本("加工材料")
	PushDebugMessage("#eDC4C18#cFFFF00 进行仓库整理一套---买卖补给")
	执行脚本("[功能] 买卖补给")
	PushDebugMessage("#eDC4C18#cFFFF00 进行仓库整理一套---销毁宝宝肉")
	执行脚本("[功]销指定物品")
	local g_szItemName = AI_GetParameter("仓库取物")
	local nCnt = Bank_GetItem(" 彩棉 龙纹玉灵 麟木箭 炼玉10级 丹青 龙血矿石 彩虹之箭 打造图 缝纫类材 九宫盒 丝线3级 染料3级 高级布片 棉布碎片 琉璃焰 御瑶盘 稀世珍宝图 秘银碎片 精铁碎片 玄天寒玉 低级宝石合成符 宝石雕琢符3级 灵鹫石 五毒珠·元阳 五毒珠·魂武 五毒珠·星眸 绿晶石(1级) 蓝晶石(1级) 黄晶石(1级) 红晶石(1级) 猫眼石(1级) 虎眼石(1级) 石榴石(1级) 月光石(1级) 尖晶石(1级) 祖母绿(1级) 变石(1级) 黄玉(1级) 碧玺(1级) 紫玉(1级) 皓石(1级) 黄宝石(1级) 蓝宝石(1级) 绿宝石(1级) 黑宝石(1级) 红宝石(1级) 缀龙石·元 缀龙石·伤 缀龙石·暴 技能书 玉龙髓 净云水 铸纹血玉 玉华灵泉 ", 31,1)
	-----开始----------------------
	local MapName = GetActiveSceneName()
	--判断角色当前所在地图，就近领取任务
	if MapName == "洛阳" then
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
	elseif MapName == "苏州" then
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
	elseif MapName == "大理" then
		MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
	elseif MapName == "楼兰" then
		MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
	else
		执行脚本("[功能] 回城")
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
	end
	QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
	-----结束----------------------
end

执行脚本("[新]自动畅游加");Sleep(1000)
--取仓库东西去帮会等待
getItemsFromBagstoBH()
--等待*分钟后运行
waitForFriends();
--检查背包道具栏里面是否有多余的一个空白空间--
checkBaseBagEmptyNumbs();
--检查背包材料栏里面是否有多余的一个空白空间--
checkMatBagEmptyNumbs();
GotoNPC();
--取出物品
getBaseItemsFromBank();
getMatItemsFromBank();
--存入物品
findBaseItemsToBank();
findMatItemsToBank();