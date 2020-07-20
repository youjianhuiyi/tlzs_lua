
--�ڽ���[��Ϣ]-[�Զ������]ҳ�棬�����ò������Ͳ�������
--���磺  ������|1-2 2-3 2-5
-- 2-3��ʾ�ڶ�������������౾�ÿո����
local m_xiulian = AI_GetParameter_User("������") 

-- ����_��������
local function xl_parseParam()
    local tXiu = {}
    local t1 = SplitString(m_xiulian, " ") --ͨ���ո�ָ����
    for i = 1, #t1 do
        local tmp = t1[i]
        local t2 = SplitString(tmp, "-") --�ٴηָ���� 2-1
        if #t2 == 2 then --ȷ���Ƿ�2��ֵ
            local mj = tonumber(t2[1]) --�ı��ؼ�
            local jn = tonumber(t2[2]) --�ı�����
            if type(mj) == "number" and type(jn) == "number" then --ȷ�ϲ�����ȷ��
                table.insert(tXiu, {miji = mj, jineng = jn}) --��Ҫ��ļ�������
            end
        end
    end
    return tXiu
end

--����_��������
local function xl_upgradeSkill(tSkill)
    DebugMessage("��%d������%d����Ҫ��������", tSkill.miji, tSkill.jineng)
    local select = -1
    if tSkill.miji == 2 then
        select = tSkill.jineng + 5
    elseif tSkill.miji == 3 then
        select = tSkill.jineng + 11
    end
    local strText =
        string.format(
        [[
			local select = %d - 1
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("AskXiuLianAdvanceJingJie");
				Set_XSCRIPT_ScriptID(002099);
				Set_XSCRIPT_Parameter(0,tonumber(171));
				Set_XSCRIPT_Parameter(1,tonumber(select));
				Set_XSCRIPT_ParamCount(2);
			Send_XSCRIPT();
		]],
        select
    )
    if select ~= -1 then
        GetLuaValue(strText, "", 0)
        Sleep(500)
    end
end

--�߼�
function _SMain(...)
    local nTimeOut = -1 --��ʱʱ��
    local tXiu = xl_parseParam() --��������
    if #tXiu == 0 then
        DebugMessage("û�н�������ȷ�Ĳ���������[��Ϣ]-[�Զ������]ҳ��ָ����ʽ����")
        return
    end
    --
    while true do
        MoveToNPC(241, 31, 2, "ɨ����ɮ", nil, nil, T_callback_no_fuben)
        if nTimeOut == -1 then
            nTimeOut = GetTickCount() --��ʼ����ʱ
        end
        Sleep(600)
        QuestFrameOptionClicked_Item("#{XL_XML_35}", 1, 800) --����
        DeleteDebugMsg("#{XL_090707_04}") --���ָ����Ļ��Ϣ
        for i = 1, #tXiu do
            local tmp = tXiu[i]
            GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Xinfa_Clicked(%d)", tmp.miji), "", 0) ----����ؼ�
            Sleep(800)
            GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Skill_Clicked(%d)", tmp.jineng), "", 0) ----�������
            Sleep(800)
            GetLuaValue("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_UpLevel_Clicked()", "", 0) ----���ѧϰ
            Sleep(800)
            if IsInDebugMsg("#{XL_090707_04}", 1) then --�Ƿ������ʾ�����������Ļ��Ϣ
                xl_upgradeSkill(tmp) --����������
            end
        end
        Sleep(500)
        if Player:GetDataInt("POWER") < 33 then
            DebugMessage("����ֵ������")
            break
        end
        if nTimeOut ~= -1 and GetTickCount() - nTimeOut > 1 * 60 * 1000 then
            DebugMessage("��������ʱ1����")
            break
        end
    end
end

_SMain()
