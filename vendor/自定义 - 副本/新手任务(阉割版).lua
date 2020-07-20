--����ǰ20������
LoadScript("fn������ȡ˫��") --������ع���
--DoubleExp_Get(nTime) ��˫����λ�Ƿ���
--DoubleExp_Freeze() --��˫
AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ
CDG:fubeiInit() --��ʼ��CDGһЩ����

local m_menpai = "����" --��ң���
local m_max_level = 40 --����������
local m_card = true --�Ƿ񼤻�������ʥ��

DebugMessage("�������񣺼�������-" .. m_menpai .. "���ȼ�-" .. m_max_level)

--ˢ�¿ɽ�����
function CollectMissionOutline()
    GetLuaValue("CollectMissionOutline()", "", 0)
end
--��������
function mission_complete_accept(strClicked, bNext, bComplete, bAccept)
    Sleep(300)
    QuestFrameOptionClicked_Item(strClicked, 1, 600)
    if bNext then
        QuestFrameNextClicked()
        Sleep(600)
    end
    if bComplete then
        DelBagItem(-1) --���
        QuestFrameMissionComplete()
        Sleep(600)
    end
    if bAccept then
        QuestFrameAcceptClicked()
        Sleep(600)
    end
end
--

--��Ҫ !!! �ڲ��˽������£���������� ��CDG������и�ֵ,���ܵ������������쳣 ��ʼ�� CDG:Init() CDG:fubeiInit()
--
function StartAttack(pos, sceneName, strTargetName, callback_over, callback_move, tParam)
    CDG.pos = pos or {} --����
    CDG.posIdx = 1 --��������
    CDG.posRadius = 15 --���귶Χ
    CDG.sceneName = sceneName or "" --��ͼ��
    CDG.sceneID = GetSceneIdByName(CDG.sceneName) --��ͼID
    CDG.targetName = strTargetName or "" --�Ƿ�ָ��Ŀ��
    if CDG.targetName ~= "" then
        CDG.targetName = " " .. CDG.targetName .. " " --��ʽ������
    end
    CDG.callfun = callback_over or nil --�����̵Ļص�����,����true�������
    CDG.callfun_move = callback_move or nil --Ѱ·�Ļص�����

    --CDG.targetOwer = "����" --�������ɫ �����,������������
    CDG.tragetSelect = true --ѡ��Ŀ��
    CDG.attack = true --�Ƿ񹥻�
    CDG.die.out = true --��������
    CDG.die.maxCount = 0 --�����������
    CDG.savebank = false --
    --
    CDG.pickup = false --���
    CDG.attackMode = "��������" --���ģʽ
    CDG.horse = true --ʹ������

    if tParam.pickup ~= nil then
        CDG.pickup = tParam.pickup --�Ƿ������˼��
    end
    if tParam.attackMode ~= nil then
        CDG.attackMode = tParam.attackMode --�Ƿ������˴��ģʽ
    end
    if tParam.horse ~= nil then
        CDG.horse = tParam.horse --�Ƿ�ʹ������,LoadScript("fnGoToPoint.lua") ���ﻹ�ǻ�������
    end

    CDG:OnStart() --������һ����ѭ������ CDG.callfun ����ص����������˳�
end
--������
function mission_accept(mission)
    PushDebugMessage("������" .. mission.name)
    local param = mission.param_accept
    local use_horse = true
    if param.use_horse ~= nil and param.use_horse == false then
        use_horse = false --�Ƿ�ʹ������
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
--�������ڸ�����ͼ������(û��call back���������ܵ�����ѭ��)
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
                DebugStr("�¸�����" .. param.next_mission[i])
            end
            if bAccept == false then
                break
            end
            Sleep(100)
        end
    end
end
--������:ֱ�ӶԻ�NPC
function mission_complete_talk_npc(mission)
    PushDebugMessage("������" .. mission.name)
    Team:LeaveTeam() --�뿪����
    local param = mission.param_complete
    local use_horse = true
    if param.use_horse ~= nil and param.use_horse == false then
        use_horse = false
    end

    local call_back_run = nil
    if param.call_back_run ~= nil then
        call_back_run = param.call_back_run
    elseif param.sceneName ~= nil and param.sceneName ~= "" then
        call_back_run = function(fX, fY, nScene) --��������˵�ͼ����,����ûص�����
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
        GetLuaValue("meReliveHandle(-1)", "", 0) --��������
        DebugStr("���ڽ�����" .. mission.name)
        if call_back_run and call_back_run() == false then
            break
        end
    end
    mission_accept_next(mission) --������
end

--�򵥵Ĺ���ģʽ,�ô�������ģʽ
function mission_attack_mode_1(mission)
    local strMission = mission.option[1]
    local param = mission.param_action
    local nTick = GetTickCount()
    local call_back_attack =
        function()
        DebugStr(mission.name .. ":ִ����%d", 2, (GetTickCount() - nTick) / 1000)
        local nComplete, nIndex = GetMissionVariableByName_Item(strMission, 0) --����ֵ1����Χ�Ƿ���ɣ�2����������
        if nComplete == 1 or nIndex == -1 then
            return true
        end
        if mission.is_check_team then
            TeamCheckNear() --�������
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
        --�˴���Ҫ�õ�ͼ���жϽ������ᵼ�²�ȥ�һ���
    end
    --
    local pickmode = g_pick.pickmode --����ʰȡģʽ
    local removeItem = g_pick.removeItem --�����ų���Ʒ
    local pickItem = g_pick.pickItem --����ʰȡ��Ʒ
    if param.pick_item and param.pick_item ~= "" then
        PickUpLua_SetItem(param.pick_item) --���ָ����Ҫʰȡ����Ʒ����
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
    g_pick.pickmode = pickmode --�ָ�
    g_pick.removeItem = removeItem --�ָ�
    g_pick.pickItem = pickItem --�ָ�
end
--[[



										����

]]
local m_NPC = {}
m_NPC[1] = {x = 187, y = 205, sceneID = 6, sceneName = "", name = "���˵�ɽ��", use_horse = false, call_back_run = nil}
m_NPC[2] = {x = 194, y = 174, sceneID = 6, sceneName = "", name = "���յ�����", use_horse = false, call_back_run = nil}
m_NPC[3] = {x = 238, y = 133, sceneID = 6, sceneName = "", name = "������������", use_horse = false, call_back_run = nil}
m_NPC[4] = {x = 238, y = 133, sceneID = 6, sceneName = "", name = "������������", use_horse = false, call_back_run = nil}
m_NPC[5] = {x = 276, y = 94, sceneID = 6, sceneName = "", name = "ľ����", use_horse = false, call_back_run = nil}
m_NPC[6] = {x = 276, y = 94, sceneID = 6, sceneName = "", name = "ľ����", use_horse = false, call_back_run = nil}
m_NPC[7] = {x = 209, y = 106, sceneID = 6, sceneName = "", name = "�����Ķ���", use_horse = true, call_back_run = nil}
m_NPC[8] = {x = 63, y = 172, sceneID = 6, sceneName = "", name = "����Ķ���", use_horse = true, call_back_run = nil}
m_NPC[9] = {x = 271, y = 133, sceneID = 2, sceneName = "", name = "��ƮƮ", use_horse = true, call_back_run = nil}
m_NPC[10] = {x = 219, y = 123, sceneID = 2, sceneName = "", name = "����", use_horse = true, call_back_run = nil}
m_NPC[11] = {x = 254, y = 174, sceneID = 2, sceneName = "", name = "�ƹ���", use_horse = true, call_back_run = nil}
m_NPC[12] = {x = 160, y = 159, sceneID = 2, sceneName = "", name = "����ʦ", use_horse = true, call_back_run = nil}
--13��������
m_NPC[13] = {x = 256, y = 273, sceneID = LUOYANG_ID, sceneName = "", name = "����ʦ", use_horse = true} --call_back_run = nil ��ֹ����
m_NPC[14] = {x = 252, y = 144, sceneID = 8, sceneName = "", name = "���Ĺ�", use_horse = true, call_back_run = nil}
m_NPC[15] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "��ȫ��", use_horse = true, call_back_run = nil} --�����˻�
m_NPC[16] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "��ȫ��", use_horse = true, call_back_run = nil} --����Ȫˮ
m_NPC[17] = {x = 258, y = 163, sceneID = 8, sceneName = "", name = "��ȫ��", use_horse = true, call_back_run = nil} --����Ⱥ��
m_NPC[18] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "�ⳤ��", use_horse = true, call_back_run = nil} --����֧Ԯ
m_NPC[19] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "�ⳤ��", use_horse = true, call_back_run = nil} --ţ��С��
m_NPC[20] = {x = 141, y = 126, sceneID = 8, sceneName = "", name = "�ⳤ��", use_horse = true, call_back_run = nil} --��װ׼��

--
local m_tMission = {}
--Ե������
m_tMission[1] = {
    name = "Ե������", --��������
    option = {"#{XSLC_130831_01}"}, --���ѡ���һ��һ��Ҫ��������(����)
    is_check_team = false, --������
    is_complete = false, --�Ƿ����
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
--·����ƽ
m_tMission[2] = {
    name = "·����ƽ",
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
        sceneName = "����ɽ", --�Ǹ����˲���һ��Ҫ���գ�����Ϊ�գ�call_back_run һ��ҪΪnil
        targetName = "��ũ��ආ�"
    },
    OnAction = mission_attack_mode_1
}
--�书��ʽ
m_tMission[3] = {
    name = "�书��ʽ",
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
        sceneName = "����ɽ", --�Ǹ����˲���һ��Ҫ���գ�����Ϊ�գ�call_back_run һ��ҪΪnil
        targetName = "��ũ�ﾫӢ"
    },
    OnAction = mission_attack_mode_1
}
--������ս
m_tMission[4] = {
    name = "������ս",
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
        sceneName = "����ɽ", --�Ǹ����˲���һ��Ҫ���գ�����Ϊ�գ�call_back_run һ��ҪΪnil
        targetName = "��ũ������"
    },
    OnAction = mission_attack_mode_1
}
--�Ѳ�����
m_tMission[5] = {
    name = "�Ѳ�����",
    option = {"#{XSLC_130831_49}"},
    --
    param_accept = m_NPC[4],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[5],
    OnComplete = mission_complete_talk_npc
}
--�������
m_tMission[6] = {
    name = "�������",
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
            DebugStr("ִ������:" .. m_tMission[6].name)
            MoveTo(204, 59, 6, nil, 1, nil, nil)
            local tObj = Enum2XByName("�����۵�����", {1, 1, 0, 0}, nil, nil, 0) --12 NPC
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
--������թ
m_tMission[7] = {
    name = "������թ",
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
            DebugStr("ִ������:" .. m_tMission[7].name)
            Dismount()
            Sleep(500)
            Bag:UseItem_3("����ʥʹ����ñ")
            MoveToNPC(200, 104, 6, "˾����", nil, false)
            Sleep(500)
            QuestFrameOptionClicked_Item("#{XSLC_130831_109}", 1, 500) --��ȡ�ⶾҩ
            local nComplete, nIndex = GetMissionVariableByName_Item(m_tMission[7].option, 0)
            if nComplete == 1 or nIndex == -1 then
                break
            end
            Sleep(200)
        end
    end
}
--�������
m_tMission[8] = {
    name = "�������",
    option = {"#{XSLC_130831_112}"},
    --
    param_accept = m_NPC[7],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[8],
    OnComplete = mission_complete_talk_npc
}
--�����̵�
m_tMission[9] = {
    name = "�����̵�",
    option = {"#{XSLC_130831_135}"},
    --
    param_accept = m_NPC[8],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[9],
    OnComplete = mission_complete_talk_npc
}
--�����̵�
m_tMission[10] = {
    name = "�����̵�",
    option = {"#{XSLC_130831_138}"},
    --
    param_accept = m_NPC[9],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[10],
    OnComplete = mission_complete_talk_npc
}
--�����̵�
m_tMission[11] = {
    name = "�����̵�",
    option = {"#{XSLC_130831_148}"},
    --
    param_accept = m_NPC[10],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[11],
    OnComplete = mission_complete_talk_npc
}
--�ݷ���ʦ
m_tMission[12] = {
    name = "�ݷ���ʦ",
    option = {"#{XSLC_130831_176}"},
    --
    param_accept = m_NPC[11],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[12],
    OnComplete = mission_complete_talk_npc
}

--���
local m_UsherInfo = {
    {menpai = "����", name = "����", x = 154, y = 129},
    {menpai = "����", name = "ʯ��", x = 166, y = 138},
    {menpai = "ؤ��", name = "����", x = 154, y = 133},
    {menpai = "�䵱", name = "�Ż�", x = 154, y = 126},
    {menpai = "����", name = "·����", x = 154, y = 137},
    {menpai = "����", name = "������", x = 166, y = 131},
    {menpai = "����", name = "��̰", x = 166, y = 128},
    {menpai = "��ɽ", name = "����˪", x = 166, y = 135},
    {menpai = "��ң", name = "�̨����", x = 166, y = 124},
    {menpai = "Ľ��", name = "Ľ�ݴ�", x = 154, y = 140},
    {menpai = "����", name = "����", x = 166, y = 142},
    {menpai = "���", name = "�", x = 153, y = 142}
}
--��������
m_tMission[13] = {
    name = "��������",
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
            PushDebugMessage("����������������������")
            return
        end
        local npc = m_UsherInfo[idx]
        MoveToNPC(npc.x, npc.y, 2, npc.name)
        QuestFrameOptionClicked_Item("��������", 0, 500) --#G��������
        if m_menpai == "����" then
            QuestFrameOptionClicked_Item("#{XMPTM_130123_116}", 1, 500) --��ȷ��Ҫ����������
        else
            QuestFrameOptionClicked_Item("��ȷ��Ҫ", 0, 500) --��ȷ��Ҫ�����䵱��
        end
        QuestFrameMissionComplete()
    end
}
--�����ػ�
m_tMission[14] = {
    name = "�����ػ�",
    option = {"#{DHRW_130904_226}"}, --#{XSLC_130831_356}
    --
    param_accept = m_NPC[13],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[14],
    OnComplete = mission_complete_talk_npc
}
--�����˻�
m_tMission[15] = {
    name = "�����˻�",
    option = {"#{DHRW_130904_227}"},
    --
    param_accept = m_NPC[14],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[15],
    OnComplete = mission_complete_talk_npc
}
--����Ȫˮ
m_tMission[16] = {
    name = "����Ȫˮ",
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
        Bag:UseItem_3("����Ͳ")
    end
}
--����Ⱥ��
m_tMission[17] = {
    name = "����Ⱥ��",
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
        sceneName = "�ػ�",
        targetName = "ɳ����"
    },
    OnAction = mission_attack_mode_1
}
--����֧Ԯ
m_tMission[18] = {
    name = "����֧Ԯ",
    option = {"#{DHRW_130904_230}"},
    --
    param_accept = m_NPC[17],
    OnAccept = mission_accept,
    --
    param_complete = m_NPC[18],
    OnComplete = mission_complete_talk_npc
}
--ţ��С��
m_tMission[19] = {
    name = "ţ��С��",
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
        sceneName = "�ػ�",
        targetName = "����ʿ��"
    },
    OnAction = mission_attack_mode_1
}
--��װ׼��
m_tMission[20] = {
    name = "��װ׼��",
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
                {x = 98, y = 136, name = "����ʿ����ͷ��"},
                {x = 87, y = 144, name = "����ʿ��������"},
                {x = 107, y = 146, name = "����ʿ���ĳ���"}
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
--�����Ӫ ������ ��������� ��������ɻ����
m_tMission[21] = {
    name = "�����Ӫ",
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
--������
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
            CDG.pet1.OldIdx = nIndex --��ս����
            CDG.pet1.OldGUID = nGUID --��ս����
            CDG.pet1.idx = nIndex --��ս����
            CDG.pet1.GUID = nGUID --��ս����
        end
    end
end
--��ȡ��Ʒ
local function xs_checkAll()
    -- ��Ļ��ʣ��ʱ��Ϊ��ʱ��˵������ȡ�ˣ�
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
    --����װ��
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
    --������Ʒ
    --xs_useBagItem()
    --������
    xs_setActionPet()
    --���޼ӵ�
    Pet:AddtAttribute()
    --����
    Player:LevelUp(m_max_level)
    --����
end

--
function _SMain(...)
    while true do
        local debugnote = " �޿ɽ�����"
        xs_checkAll()
        --���ж��Ƿ�������δ���
        local bDoAction = false
        if bDoAction == false then
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                local nComplete, nIndex = GetMissionVariableByName_Item(mis.option[1], 0)
                if nIndex ~= -1 and nComplete == 0 then
                    debugnote = "ִ������:" .. mis.name
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
        --�б��޿���������������
        if bDoAction == false then
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                local nComplete, nIndex = GetMissionVariableByName_Item(mis.option[1], 0)
                if nComplete == 1 then
                    --PushDebugMessage(mis.name)
                    debugnote = "������" .. mis.name
                    mis.is_complete = true --!!!
                    mis.OnComplete(mis)
                    bDoAction = true
                    break
                end
            end
        end
        --û��Ҫ��Ҫ��������ʱ��ˢ�¿ɽ�����
        if bDoAction == false then
            CollectMissionOutline()
            for i = 1, #m_tMission do
                local mis = m_tMission[i]
                if (mis.is_complete == nil or mis.is_complete == false) and IsMissionOutline(mis.name) then
                    debugnote = "�ɽ�����" .. mis.name
                    bDoAction = true
                    mis.OnAccept(mis)
                end
            end
            Sleep(1000)
        end

        local nLevel = Player:GetDataInt("LEVEL")
        if nLevel >= m_max_level then
            break --�ȼ��ﵽ
        end
        Sleep(100)
        DebugStr("�������� " .. debugnote)
    end
end

_SMain()
