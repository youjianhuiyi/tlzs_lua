AI_SetParameter("NEWOLD_daguai", 1) --设置新打怪模式
CDG:fubeiInit() --初始化CDG一些参数

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

xs_setActionPet()

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