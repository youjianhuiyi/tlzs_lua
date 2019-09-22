local m_missionName = "清剿：九黎余孽"
local m_npc = {
    {x = 223, y = 215, sceneID = 697, name = "汤学真", tid = 146}
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

--打怪循环体的回调函数，控制打怪结束，返回true则结束打怪
function CDG_callback(...)
    local nComplete = GetMissionVariableByName(m_missionName, 0) --获取任务的完成度
    --MessageBox(nComplete)
    if nComplete ~= 0 then
        return true --不为0，返回true则结束打怪
    end
    return false
end
CDG.callfun = CDG_callback --给循环体的回调函数赋值

--逻辑
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

_SMain()
--回城
MoveTo(155, 155, 580, nil, nil, nil)

