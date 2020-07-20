
--在界面[信息]-[自定义参数]页面，可设置参数名和参数内容
--例如：  点修炼|1-2 2-3 2-5
-- 2-3表示第二本宝典第三卷，多本用空格隔开
local m_xiulian = AI_GetParameter_User("点修炼") 

-- 修炼_解析参数
local function xl_parseParam()
    local tXiu = {}
    local t1 = SplitString(m_xiulian, " ") --通过空格分割参数
    for i = 1, #t1 do
        local tmp = t1[i]
        local t2 = SplitString(tmp, "-") --再次分割参数 2-1
        if #t2 == 2 then --确认是否2个值
            local mj = tonumber(t2[1]) --哪本秘籍
            local jn = tonumber(t2[2]) --哪本技能
            if type(mj) == "number" and type(jn) == "number" then --确认参数正确性
                table.insert(tXiu, {miji = mj, jineng = jn}) --需要点的加入数组
            end
        end
    end
    return tXiu
end

--修炼_提升境界
local function xl_upgradeSkill(tSkill)
    DebugMessage("第%d本，第%d卷需要提升境界", tSkill.miji, tSkill.jineng)
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

--逻辑
function _SMain(...)
    local nTimeOut = -1 --超时时间
    local tXiu = xl_parseParam() --解析参数
    if #tXiu == 0 then
        DebugMessage("没有解析到正确的参数，请在[信息]-[自定义参数]页按指定格式输入")
        return
    end
    --
    while true do
        MoveToNPC(241, 31, 2, "扫地神僧", nil, nil, T_callback_no_fuben)
        if nTimeOut == -1 then
            nTimeOut = GetTickCount() --初始化计时
        end
        Sleep(600)
        QuestFrameOptionClicked_Item("#{XL_XML_35}", 1, 800) --修炼
        DeleteDebugMsg("#{XL_090707_04}") --清除指定屏幕信息
        for i = 1, #tXiu do
            local tmp = tXiu[i]
            GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Xinfa_Clicked(%d)", tmp.miji), "", 0) ----点击秘籍
            Sleep(800)
            GetLuaValue(string.format("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_Skill_Clicked(%d)", tmp.jineng), "", 0) ----点击技能
            Sleep(800)
            GetLuaValue("setmetatable(_G, {__index=XiulianStudy_Env});XiulianStudy_UpLevel_Clicked()", "", 0) ----点击学习
            Sleep(800)
            if IsInDebugMsg("#{XL_090707_04}", 1) then --是否存在提示提升境界的屏幕信息
                xl_upgradeSkill(tmp) --存在则升级
            end
        end
        Sleep(500)
        if Player:GetDataInt("POWER") < 33 then
            DebugMessage("功力值不够！")
            break
        end
        if nTimeOut ~= -1 and GetTickCount() - nTimeOut > 1 * 60 * 1000 then
            DebugMessage("点修炼超时1分钟")
            break
        end
    end
end

_SMain()
