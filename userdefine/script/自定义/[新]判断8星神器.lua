--[[
    脚本功能：用来判断哪些号不需要刷九黎余孽,将需要刷的角色名称添加到 allPlayers.lua 指定的项目里面即可
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

LoadScript("allPlayers.lua")
local m_missionName = "清剿：九黎余孽"
local DropCommonItem = {"后肘肉口粮","蝗虫口粮","棕榈口粮"}
local m_npc = {
    {x = 223, y = 215, sceneID = 697, name = "汤学真", tid = 146},
    {x = 180, y = 156, sceneID = 697, name = "汤学真", tid = 146},
    {x = 101, y = 200, sceneID = 697, name = "汤学真", tid = 146},
    {x = 79, y = 168, sceneID = 697, name = "汤学真", tid = 146},
    {x = 79, y = 127, sceneID = 697, name = "汤学真", tid = 146},
    {x = 116, y = 107, sceneID = 697, name = "汤学真", tid = 146}
}
LoadUserScript("坐标清剿九黎余孽")
--CDG:Init() 如果用这个初始化有问题，如果是跟随队长，则不会主动去坐标
CDG:fubeiInit() --初始化
CDG.attack = true --是否攻击
CDG.attackMode = UI_GetDGParam("打怪模式") --获取界面的设置的打怪模式
CDG.sceneName = "苍梧秘境" --打怪地图
CDG.sceneID = 698 --打怪地图ID
CDG.pos = m_pos1 --LoadUserScript("坐标清剿九黎余孽") 这里加载的坐标
CDG.posRadius = 5 --坐标半径

--CDG.targetName = ""       --只打的怪物名称
CDG.targetOwer = "红绿" --只打红怪绿怪

CDG.die.out = true --死亡出窍
--CDG.die.waittime = -1     --死亡等待时间
CDG.die.maxCount = 0 --最大死亡次数不限制
CDG.savebank = false --false 如果回城不存仓

--CDG.back = { buypetRation = false, buypetHappy = false, fullprop = false, fullmate = false, fullbag = false } --回城条件
--CDG.overMapErr = true             --地图不匹配结束打怪

AI_SetParameter("NEWOLD_daguai", 1) --新打怪

if CDG.attackMode == "普通抢怪" or CDG.attackMode == "超级抢怪" then
    CDG.attackMode = "默认模式"
end

-----------------------------------------------------------
-- 打怪循环体的回调函数，控制打怪结束，返回true则结束打怪
-----------------------------------------------------------
function CDG_callback(...)
    local nComplete = GetMissionVariableByName(m_missionName, 0) --获取任务的完成度
    --MessageBox(nComplete)
    if nComplete ~= 0 then
        return true --不为0，返回true则结束打怪
    end
    return false
end
CDG.callfun = CDG_callback --给循环体的回调函数赋值

-----------------------------------------------------------
-- 逻辑
-----------------------------------------------------------
function _SMain(...)
    while true do
        local nComplete = GetMissionVariableByName(m_missionName, 0) --获取任务的完成度
        if nComplete == -1 then --没有此任务
            if IsHuodongComplete(m_missionName, 1) then
                DebugMessage(m_missionName .. " 今日任务已经完成")
                break
            else
                MoveToNPC(m_npc[1].x, m_npc[1].y, m_npc[1].sceneID, m_npc[1].name, nil, true, nil, false, false)
                Sleep(600)
                QuestFrameOptionClicked_Item("#{JXMR_171027_06}", 1, 500) --清剿：九黎余孽
                QuestFrameAcceptClicked()
                Sleep(600)
            end
        elseif nComplete == 0 then --已接任务，未完成
            CDG:OnStart() --开始打怪
        elseif nComplete == 1 then --已接任务，已经完成
            DelBagItem(-1) --清包
            Skill:UseSkillByName("初级隐遁", -1, 300) --隐身
            MoveToNPC(m_npc[1].x, m_npc[1].y, m_npc[1].sceneID, m_npc[1].name, nil, true, nil, false, false)
            Sleep(600)
            QuestFrameOptionClicked_Item("#{JXMR_171027_06}", 1, 500) --清剿：九黎余孽
            QuestFrameMissionComplete()
            Sleep(500)
        end
        DebugStr("正在清剿九黎余孽...")
        Sleep(200)
    end
end

-----------------------------------------------------------
-- 销毁肉交任务，因为有时候是从定时出来的，防止卡
-----------------------------------------------------------
function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("销毁物品名称： [" .. value.."]");
			-- 等待(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
	
end

-----------------------------------------------------------
-- 判断背包里面的脚本
-----------------------------------------------------------
function judgeBagIsEmpty()
    local tObj = Bag:EnumAllObj()
	local n = 0
	local m = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1
		end
	end
	return {bag1 = n,bag2 = m}
end

-----------------------------------------------------------
-- 核心调用
-----------------------------------------------------------
-- 判断用户是否需要参加任务 
for key,value in ipairs(players) do
	local playName = GetPlayerInfo("NAME");
	PushDebugMessage(playName);
    if playName == value then
        -- 如果背包没有满包，直接执行下面的任务 
        local bags = judgeBagIsEmpty();
        if bags[bag1] > 27 then
            for i = 1,6 do
                destroyItem();
            end
        end

		_SMain()
		--回城
		MoveTo(155, 155, 580, nil, nil, nil)
		Sleep(1000)
    end
end


MoveToNPC(340,210,1,"苏州")
