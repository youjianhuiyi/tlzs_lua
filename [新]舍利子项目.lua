AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ
CDG:fubeiInit() --��ʼ��CDGһЩ����

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

xs_setActionPet()

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