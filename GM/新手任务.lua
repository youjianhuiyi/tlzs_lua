--新手前20个任务
LoadScript("fn冻结领取双倍") --加载相关功能
--DoubleExp_Get(nTime) 领双，单位是分钟
--DoubleExp_Freeze() --冻双
AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式
CDG:fubeiInit() --初始化CDG一些参数

local m_menpai = "峨嵋" --逍遥鬼谷
local m_max_level = 40 --升级到多少
local m_card = true --是否激活至尊武圣卡

DebugMessage("新手任务：加入门派-" .. m_menpai .. "，等级-" .. m_max_level)

--刷新可接任务
function CollectMissionOutline()
    GetLuaValue("CollectMissionOutline()", "", 0)
end
--交接任务
function mission_complete_accept(strClicked, bNext, bComplete, bAccept)
    Sleep(300)
    QuestFrameOptionClicked_Item(strClicked, 1, 600)
    if bNext then
        QuestFrameNextClicked()
        Sleep(600)
    end
    if bComplete then
        DelBagItem(-1) --清包
        QuestFrameMissionComplete()
        Sleep(600)
    end
    if bAccept then
        QuestFrameAcceptClicked()
        Sleep(600)
    end
end
--

--重要 !!! 在不了解的情况下，请勿随意对 【CDG】类进行赋值,可能导致其他功能异常 初始化 CDG:Init() CDG:fubeiInit()
--
function StartAttack(pos, sceneName, strTargetName, callback_over, callback_move, tParam)
    CDG.pos = pos or {} --坐标
    CDG.posIdx = 1 --坐标索引
    CDG.posRadius = 15 --坐标范围
    CDG.sceneName = sceneName or "" --地图名
    CDG.sceneID = GetSceneIdByName(CDG.sceneName) --地图ID
    CDG.targetName = strTargetName or "" --是否指定目标
    if CDG.targetName ~= "" then
        CDG.targetName = " " .. CDG.targetName .. " " --格式化名称
    end
    CDG.callfun = callback_over or nil --主流程的回调函数,返回true结束打怪
    CDG.callfun_move = callback_move or nil --寻路的回调函数

    --CDG.targetOwer = "红绿" --怪物的颜色 红白绿,这里无需设置
    CDG.tragetSelect = true --选中目标
    CDG.attack = true --是否攻击
    CDG.die.out = true --死亡出窍
    CDG.die.maxCount = 0 --最大死亡次数
    CDG.savebank = false --
    --
    CDG.pickup = false --捡包
    CDG.attackMode = "打死换怪" --打怪模式
    CDG.horse = true --使用坐骑

    if tParam.pickup ~= nil then
        CDG.pickup = tParam.pickup --是否设置了捡包
    end
    if tParam.attackMode ~= nil then
        CDG.attackMode = tParam.attackMode --是否设置了打怪模式
    end
    if tParam.horse ~= nil then
        CDG.horse = tParam.horse --是否使用坐骑,LoadScript("fnGoToPoint.lua") 这里还是会上坐骑
    end

    CDG:OnStart() --这里是一个死循环，靠 CDG.callfun 这个回调函数控制退出
end
--接任务
function mission_accept(mission)
    PushDebugMessage("接任务：" .. mission.name)
    local param = mission.param_accept
    local use_horse = true
    if param.use_horse ~= nil and param.use_horse == false then
        use_horse = false --是否使用坐骑
    end
    local call_back_run = nil
    if param.call_back_run ~= nil then
        call_back_run = param.call_back_run
    elseif param.sceneName ~= nil and param.sceneName ~= "" then
        call_back_run = function(fX, fY, nScene)
            if GetActiveSceneName() ~= param.sceneName then
                return false
            end
            return true
        end
    end
    MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
    mission_complete_accept(mission.option[1], false, false, true)
end
--不能用于副本地图接任务(没有call back，副本可能导致死循环)
function mission_accept_next(mission)
    local param = mission.param_complete
    if param and param.next_mission then
        local nTick = GetTickCount()
        while GetTickCount() - nTick < 10 * 1000 do
            local bAccept = false
            for i = 1, #param.next_mission do
                local nIndex, idMission, idScript = GetPlayerMission_Item(param.next_mission[i])
                if nIndex == -1 then
                    MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, nil, nil)
                    mission_complete_accept(param.next_mission[i], false, false, true)
                    bAccept = true
                end
                DebugStr("下个任务：" .. param.next_mission[i])
            end
            if bAccept == false then
                break
            end
            Sleep(100)
        end
    end
end
--交任务:直接对话NPC
function mission_complete_talk_npc(mission)
    PushDebugMessage("交任务：" .. mission.name)
    Team:LeaveTeam() --离开队伍
    local param = mission.param_complete
    local use_horse = true
    if param.use_horse ~= nil and param.use_horse == false then
        use_horse = false
    end

    local call_back_run = nil
    if param.call_back_run ~= nil then
        call_back_run = param.call_back_run
    elseif param.sceneName ~= nil and param.sceneName ~= "" then
        call_back_run = function(fX, fY, nScene) --如果设置了地图名称,则调用回调函数
            if GetActiveSceneName() ~= param.sceneName then
                return false
            end
            return true
        end
    end
    ------------------
    while true do
        MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
        if #mission.option == 1 then
            mission_complete_accept(mission.option[1], true, true, true) --
        elseif #mission.option > 1 then
            for i = 1, #mission.option do
                QuestFrameOptionClicked_Item(mission.option[i], 1, 600)
            end
            mission_complete_accept(mission.option[1], true, true, true) --
        end
        local nComplete, nIndex = GetMissionVariableByName_Item(mission.option[1], 0)
        if nComplete ~= 1 or nIndex == -1 then
            break
        end
        Sleep(200)
        GetLuaValue("meReliveHandle(-1)", "", 0) --死亡出窍
        DebugStr("正在交任务：" .. mission.name)
        if call_back_run and call_back_run() == false then
            break
        end
    end
    mission_accept_next(mission) --接任务
end

--简单的攻击模式,用打死换怪模式
function mission_attack_mode_1(mission)
    local strMission = mission.option[1]
    local param = mission.param_action
    local nTick = GetTickCount()
    local call_back_attack =
        function()
        DebugStr(mission.name .. ":执行中%d", 2, (GetTickCount() - nTick) / 1000)
        local nComplete, nIndex = GetMissionVariableByName_Item(strMission, 0) --返回值1：范围是否完成，2：任务索引
        if nComplete == 1 or nIndex == -1 then
            return true
        end
        if mission.is_check_team then
            TeamCheckNear() --附近组队
        end
        return false
    end
    if param.call_back_attack ~= nil then
        call_back_attack = param.call_back_attack
    end
    local call_back_run = nil
    if param.call_back_run ~= nil then
        call_back_run = param.call_back_run
    else
        --此处不要用地图名判断结束，会导致不去挂机点
    end
    --
    local pickmode = g_pick.pickmode --保存拾取模式
    local removeItem = g_pick.removeItem --保存排除物品
    local pickItem = g_pick.pickItem --保存拾取物品
    if param.pick_item and param.pick_item ~= "" then
        PickUpLua_SetItem(param.pick_item) --如果指定了要拾取的物品名称
    end

    --
    StartAttack(
        param.pos,
        param.sceneName,
        param.targetName,
        call_back_attack,
        call_back_run,
        {pickup = param.is_pick, horse = param.use_horse}
    )
    g_pick.pickmode = pickmode --恢复
    g_pick.removeItem = removeItem --恢复
    g_pick.pickItem = pickItem --恢复
end
--[[



										任务

]]
local m_NPC = {}
m_NPC[1] = {x = 187, y = 205, sceneID = 6, sceneName = "", name = "受伤的山民", use_horse = false, call_back_run = nil}
m_NPC[2] = {x = 194, y = 174, sceneID = 6, sceneName = "", name = "遇险的钟灵", use_horse = false, call_back_run = nil}
m_NPC[3] = {x = 238, y = 133, sceneID = 6, sceneName = "", name = "剑湖宫的钟灵", use_horse = false, call_back_run = nil}
m_NPC[4] = {x = 238, y = 133, sceneID = 6, sceneName = "", name = "剑湖宫的钟灵", use_horse = false, call_back_run = nil}
m_NPC[5] = {x = 276, y = 94, sceneID = 6, sceneName = "", name = "木婉清", use_horse = false, call_back_run = nil}
m_NPC[6] = {x = 276, y = 94, sceneID = 6, sceneName = "", name = "木婉清", use_horse = false, call_back_run = nil}
m_NPC[7] = {x = 209, y = 106, sceneID = 6, sceneName = "", name = "被俘的段誉", use_horse = true, call_back_run = nil}
m_NPC[8] = {x = 63, y = 172, sceneID = 6, sceneName = "", name = "城外的段誉", use_horse = true, call_back_run = nil}
m_NPC[9] = {x = 271, y = 133, sceneID = 2, sceneName = "", name = "云飘飘", use_horse = true, call_back_run = nil}
m_NPC[10] = {x = 219, y = 123, sceneID = 2, sceneName = "", name = "蒲良", use_horse = true, call_back_run = nil}
m_NPC[11] = {x = 254, y = 174, sceneID = 2, sceneName = "", name = "黄公道", use_horse = true, call_back_run = nil}
m_NPC[12] = {x = 160, y = 159, sceneID = 2, sceneName = "", name = "赵天师", use_horse = true, call_back_run = nil}
--13加入门派
m_NPC[13] = {x = 256, y = 273, sceneID = LUOYANG_ID, sceneName = "", name = "周天师", use_horse = true} --call_back_run = nil 防止拆行
m_NPC[14] = {x = 252, y = 144, sceneID = 8, sceneName = "", name = "杨文广", use_horse = true, call_back_run = nil}
m_NPC[15] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "张全祥", use_horse = true, call_back_run = nil} --救治伤患
m_NPC[16] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "张全祥", use_horse = true, call_back_run = nil} --月牙泉水
m_NPC[17] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "张全祥", use_horse = true, call_back_run = nil} --驱逐群狼
m_NPC[18] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "吴长风", use_horse = true, call_back_run = nil} --火线支援
m_NPC[19] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "吴长风", use_horse = true, call_back_run = nil} --牛刀小试
m_NPC[20] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "吴长风", use_horse = true, call_back_run = nil} --乔装准备

--
local m_tMission = {}
--缘起无量
m_tMission[1] = {
    name = "缘起无量", --任务名称
    option = {"#{XSLC_130831_01}"}, --点击选项，第一个一定要是任务名(常量)
    is_check_team = false, --检查组队
    is_complete = false, --是否完成
    --
    param_accept = nil,
    OnAccept = nil,
    --
    param_complete = m_NPC[1],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = nil
}
--路见不平
m_tMission[2] = {
    name = "路见不平",
    option = {"#{XSLC_130831_03}"},
    is_check_team = true,
    --
    param_accept = m_NPC[1],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[2],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = {
        pos = {{x = 187, y = 205}},
        use_horse = false,
        is_pick = false,
        call_back_run = nil,
        sceneName = "无量山", --非副本此参数一定要留空，若不为空，call_back_run 一定要为nil
        targetName = "神农帮喽啰"
    },
    OnAction = mission_attack_mode_1
}
--武功招式
m_tMission[3] = {
    name = "武功招式",
    option = {"#{XSLC_130831_18}"},
    is_check_team = true,
    --
    param_accept = m_NPC[2],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[3],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = {
        pos = {{x = 216, y = 156}},
        use_horse = false,
        is_pick = false,
        call_back_run = nil,
        sceneName = "无量山", --非副本此参数一定要留空，若不为空，call_back_run 一定要为nil
        targetName = "神农帮精英"
    },
    OnAction = mission_attack_mode_1
}
--并肩作战
m_tMission[4] = {
    name = "并肩作战",
    option = {"#{XSLC_130831_33}"},
    is_check_team = true,
    --
    param_accept = m_NPC[4],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[4],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = {
        pos = {{x = 257, y = 130}},
        use_horse = false,
        is_pick = false,
        call_back_run = nil,
        sceneName = "无量山", --非副本此参数一定要留空，若不为空，call_back_run 一定要为nil
        targetName = "神农帮堂主"
    },
    OnAction = mission_attack_mode_1
}
--寡不敌众
m_tMission[5] = {
    name = "寡不敌众",
    option = {"#{XSLC_130831_49}"},
    --
    param_accept = m_NPC[4],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[5],
    OnComplete = mission_complete_talk_npc
}
--无量玉壁
m_tMission[6] = {
    name = "无量玉壁",
    option = {"#{XSLC_130831_63}"},
    --
    param_accept = m_NPC[6],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[6],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = function()
        while true do
            DebugStr("执行任务:" .. m_tMission[6].name)
            MoveTo(204, 59, 6, nil, 1, nil, nil)
            local tObj = Enum2XByName("不起眼的土堆", {1, 1, 0, 0}, nil, nil, 0) --12 NPC
            if #tObj > 0 then
                Dismount()
                Skill:UseSkillByID(3, tObj[1].id)
                Sleep(1000)
            end
            local nComplete, nIndex = GetMissionVariableByName_Item(m_tMission[6].option, 0)
            if nComplete == 1 or nIndex == -1 then
                break
            end
            Sleep(200)
        end
    end
}
--尔虞我诈
m_tMission[7] = {
    name = "尔虞我诈",
    option = {"#{XSLC_130831_81}"},
    --
    param_accept = m_NPC[6],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[7],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = function()
        while true do
            DebugStr("执行任务:" .. m_tMission[7].name)
            Dismount()
            Sleep(500)
            Bag:UseItem_3("灵鹫圣使的衣帽")
            MoveToNPC(200, 104, 6, "司空玄", nil, false)
            Sleep(500)
            QuestFrameOptionClicked_Item("#{XSLC_130831_109}", 1, 500) --索取解毒药
            local nComplete, nIndex = GetMissionVariableByName_Item(m_tMission[7].option, 0)
            if nComplete == 1 or nIndex == -1 then
                break
            end
            Sleep(200)
        end
    end
}
--城外相会
m_tMission[8] = {
    name = "城外相会",
    option = {"#{XSLC_130831_112}"},
    --
    param_accept = m_NPC[7],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[8],
    OnComplete = mission_complete_talk_npc
}
--珍兽商店
m_tMission[9] = {
    name = "珍兽商店",
    option = {"#{XSLC_130831_135}"},
    --
    param_accept = m_NPC[8],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[9],
    OnComplete = mission_complete_talk_npc
}
--武器商店
m_tMission[10] = {
    name = "武器商店",
    option = {"#{XSLC_130831_138}"},
    --
    param_accept = m_NPC[9],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[10],
    OnComplete = mission_complete_talk_npc
}
--防具商店
m_tMission[11] = {
    name = "防具商店",
    option = {"#{XSLC_130831_148}"},
    --
    param_accept = m_NPC[10],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[11],
    OnComplete = mission_complete_talk_npc
}
--拜访天师
m_tMission[12] = {
    name = "拜访天师",
    option = {"#{XSLC_130831_176}"},
    --
    param_accept = m_NPC[11],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[12],
    OnComplete = mission_complete_talk_npc
}

--鬼谷
local m_UsherInfo = {
    {menpai = "少林", name = "慧易", x = 154, y = 129},
    {menpai = "明教", name = "石宝", x = 166, y = 138},
    {menpai = "丐帮", name = "简宁", x = 154, y = 133},
    {menpai = "武当", name = "张获", x = 154, y = 126},
    {menpai = "峨嵋", name = "路三娘", x = 154, y = 137},
    {menpai = "星宿", name = "海风子", x = 166, y = 131},
    {menpai = "天龙", name = "破贪", x = 166, y = 128},
    {menpai = "天山", name = "程青霜", x = 166, y = 135},
    {menpai = "逍遥", name = "澹台子羽", x = 166, y = 124},
    {menpai = "慕容", name = "慕容传", x = 154, y = 140},
    {menpai = "唐门", name = "唐昱", x = 166, y = 142},
    {menpai = "鬼谷", name = "杨渐", x = 153, y = 142}
}
--加入门派
m_tMission[13] = {
    name = "加入门派",
    option = {"#{XSLC_130831_177}"},
    --
    param_accept = m_NPC[12],
    OnAccept = mission_accept,
    --
    param_complete = nil,
    OnComplete = function()
        g_self.isjingong, g_self.menpai = Player:IsJinGong()
        local strName = GetMenpaiNameByID(g_self.menpai)
        for i = 1, #m_UsherInfo do
            if m_UsherInfo[i].menpai == strName then
                local npc = m_UsherInfo[i]
                MoveToNPC(npc.x, npc.y, 2, npc.name)
                mission_complete_accept("#{XSLC_130831_177}", false, true, false)
                break
            end
        end
    end,
    --
    param_action = nil,
    OnAction = function()
        local idx = -1
        for i = 1, #m_UsherInfo do
            if m_UsherInfo[i].menpai == m_menpai then
                idx = i
                break
            end
        end
        if m_UsherInfo[idx] == nil then
            PushDebugMessage("需加入的门派名称设置有误")
            return
        end
        local npc = m_UsherInfo[idx]
        MoveToNPC(npc.x, npc.y, 2, npc.name)
        QuestFrameOptionClicked_Item("加入门派", 0, 500) --#G加入门派
        if m_menpai == "唐门" then
            QuestFrameOptionClicked_Item("#{XMPTM_130123_116}", 1, 500) --我确定要拜入唐门派
        else
            QuestFrameOptionClicked_Item("我确定要", 0, 500) --我确定要拜入武当派
        end
        QuestFrameMissionComplete()
    end
}
--奔赴敦煌
m_tMission[14] = {
    name = "奔赴敦煌",
    option = {"#{DHRW_130904_226}"}, --#{XSLC_130831_356}
    --
    param_accept = m_NPC[13],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[14],
    OnComplete = mission_complete_talk_npc
}
--救治伤患
m_tMission[15] = {
    name = "救治伤患",
    option = {"#{DHRW_130904_227}"},
    --
    param_accept = m_NPC[14],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[15],
    OnComplete = mission_complete_talk_npc
}
--月牙泉水
m_tMission[16] = {
    name = "月牙泉水",
    option = {"#{DHRW_130904_228}"},
    --
    param_accept = m_NPC[16],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[16],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = function()
        MoveTo(257, 178, 8, "", 1)
        Sleep(500)
        Dismount()
        Sleep(500)
        Bag:UseItem_3("空竹筒")
    end
}
--驱逐群狼
m_tMission[17] = {
    name = "驱逐群狼",
    option = {"#{DHRW_130904_229}"},
    is_check_team = true,
    --
    param_accept = m_NPC[17],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[17],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = {
        pos = {{x = 256, y = 178}},
        use_horse = true,
        is_pick = false,
        call_back_run = nil,
        sceneName = "敦煌",
        targetName = "沙坡狼"
    },
    OnAction = mission_attack_mode_1
}
--火线支援
m_tMission[18] = {
    name = "火线支援",
    option = {"#{DHRW_130904_230}"},
    --
    param_accept = m_NPC[17],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[18],
    OnComplete = mission_complete_talk_npc
}
--牛刀小试
m_tMission[19] = {
    name = "牛刀小试",
    option = {"#{DHRW_130904_231}"},
    is_check_team = true,
    --
    param_accept = m_NPC[19],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[19],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = {
        pos = {{x = 141, y = 126}, {x = 125, y = 111}},
        use_horse = true,
        is_pick = false,
        call_back_run = nil,
        sceneName = "敦煌",
        targetName = "西夏士兵"
    },
    OnAction = mission_attack_mode_1
}
--乔装准备
m_tMission[20] = {
    name = "乔装准备",
    option = {"#{DHRW_130904_232}"},
    --
    param_accept = m_NPC[20],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[20],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = function()
        local nIndex, idMission, idScript = GetPlayerMission_Item(m_tMission[20].option[1])
        if nIndex ~= -1 then
            local item = {
                {x = 98, y = 136, name = "西夏士兵的头盔"},
                {x = 87, y = 144, name = "西夏士兵的铠甲"},
                {x = 107, y = 146, name = "西夏士兵的长刀"}
            }
            for i = 1, 3 do
                local nParam = GetMissionVariable(nIndex, i)
                if nParam == 0 then
                    MoveTo(item[i].x, item[i].y, 8)
                    Sleep(500)
                    Dismount()
                    local tObj = Enum2XByName(item[i].name, {1, 1, 0, 0}, nil, nil, 0)
                    if #tObj > 0 then
                        Skill:UseSkillByID(3, tObj[1].id)
                        Sleep(1000)
                    end
                    break
                end
            end
        end
    end
}
--深入敌营 我易容 宝塔镇河妖 长老身体可还无恙
m_tMission[21] = {
    name = "深入敌营",
    option = {"#{DHRW_130904_233}", "#{DHRW_130904_142}", "#{DHRW_130904_144}", "#{DHRW_130904_146}"},
    --
    param_accept = m_NPC[20],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[21],
    OnComplete = mission_complete_talk_npc,
    --
    param_action = nil,
    OnAction = nil
}
--置珍兽
local function xs_setActionPet(bEat)
    local szText =
        [[
            local cmp = 0
            local num = 0
            local nIndex = -1
            local nGUID = -1
            for i = 0, 9 do
                if Pet:IsPresent(i) then
                    num = num + 1
                    local ll = Pet:GetStrAptitude(i)
                    local lq = Pet:GetIntAptitude(i)
                    if ll > cmp then
                        cmp = ll
                        nIndex = i
                        _,nGUID = Pet:GetGUID(i)
                    end
                    if lq > cmp then
                        cmp = lq
                        nIndex = i
                        _,nGUID = Pet:GetGUID(i)
                    end
                end
            end
            return nIndex,nGUID ,num   
        ]]
    local nIndex, nGUID, num = GetLuaValue(szText, "nnn", 3)
    --
    if nIndex ~= -1 and nGUID ~= -1 then
        if CDG.pet1.idx ~= nIndex or CDG.pet1.GUID ~= nGUID then
            CDG.pet1.OldIdx = nIndex --出战珍兽
            CDG.pet1.OldGUID = nGUID --出战珍兽
            CDG.pet1.idx = nIndex --出战珍兽
            CDG.pet1.GUID = nGUID --出战珍兽
        end
    end
end
--领取奖品
local function xs_checkAll()
    -- 屏幕上剩余时间为空时，说明可领取了！
    local szText =
        [[
        setmetatable(_G, {__index = FreshmanWatch_Env})
        if this:IsVisible() then
            if FreshmanWatch_Time_Text:GetText() == "" then
                FreshmanWatch_Bn2Click()
                return 1
            end
        end
        return 0
    ]]
    if GetLuaValue(szText, "b", 1) then
        Sleep(200)
    end
    --立即装备
    szText =
        [[
        setmetatable(_G, {__index = FreshManMission_JLYH_Env})
        if this:IsVisible() then
            FreshManMission_JLYH_OK_Clicked()
            return 1
        end
        return 0
    ]]
    if GetLuaValue(szText, "b", 1) then
        Sleep(200)
    end
    --
    MessageBox_Self_OK_Clicked()
    --背包物品
    --xs_useBagItem()
    --置珍兽
    xs_setActionPet()
    --珍兽加点
    Pet:AddtAttribute()
    --升级
    Player:LevelUp(m_max_level)
    --其他
end

--
function _SMain(...)
    while true do
        local debugnote = " 无可接任务"
        xs_checkAll()
        --先判断是否有任务未完成
        local bDoAction = false
        if bDoAction == false then
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                local nComplete, nIndex = GetMissionVariableByName_Item(mis.option[1], 0)
                if nIndex ~= -1 and nComplete == 0 then
                    debugnote = "执行任务:" .. mis.name
                    --PushDebugMessage(mis.name)
                    if mis.OnAction then
                        mis.OnAction(mis)
                    elseif mis.OnComplete then
                        mis.OnComplete(mis)
                    end
                    bDoAction = true
                    break
                end
            end
        end
        --列表无可以做的任务交任务
        if bDoAction == false then
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                local nComplete, nIndex = GetMissionVariableByName_Item(mis.option[1], 0)
                if nComplete == 1 then
                    --PushDebugMessage(mis.name)
                    debugnote = "交任务：" .. mis.name
                    mis.is_complete = true --!!!
                    mis.OnComplete(mis)
                    bDoAction = true
                    break
                end
            end
        end
        --没有要接要交的任务时，刷新可接任务
        if bDoAction == false then
            CollectMissionOutline()
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                if (mis.is_complete == nil or mis.is_complete == false) and IsMissionOutline(mis.name) then
                    debugnote = "可接任务：" .. mis.name
                    bDoAction = true
                    mis.OnAccept(mis)
                end
            end
            Sleep(1000)
        end

        local nLevel = Player:GetDataInt("LEVEL")
        if nLevel >= m_max_level then
            break --等级达到
        end
        Sleep(100)
        DebugStr("新手任务 " .. debugnote)
    end
end

_SMain()

