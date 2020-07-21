--[[
    �ű����ܣ������ж���Щ�Ų���Ҫˢ��������,����Ҫˢ�Ľ�ɫ������ӵ� allPlayers.lua ָ������Ŀ���漴��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

LoadScript("allPlayers.lua")
local m_missionName = "��ˣ���������"
local DropCommonItem = {"���������","�ȳ����","��鵿���"}
local m_npc = {
    {x = 223, y = 215, sceneID = 697, name = "��ѧ��", tid = 146},
    {x = 180, y = 156, sceneID = 697, name = "��ѧ��", tid = 146},
    {x = 101, y = 200, sceneID = 697, name = "��ѧ��", tid = 146},
    {x = 79, y = 168, sceneID = 697, name = "��ѧ��", tid = 146},
    {x = 79, y = 127, sceneID = 697, name = "��ѧ��", tid = 146},
    {x = 116, y = 107, sceneID = 697, name = "��ѧ��", tid = 146}
}
LoadUserScript("������˾�������")
--CDG:Init() ����������ʼ�������⣬����Ǹ���ӳ����򲻻�����ȥ����
CDG:fubeiInit() --��ʼ��
CDG.attack = true --�Ƿ񹥻�
CDG.attackMode = UI_GetDGParam("���ģʽ") --��ȡ��������õĴ��ģʽ
CDG.sceneName = "�����ؾ�" --��ֵ�ͼ
CDG.sceneID = 698 --��ֵ�ͼID
CDG.pos = m_pos1 --LoadUserScript("������˾�������") ������ص�����
CDG.posRadius = 5 --����뾶

--CDG.targetName = ""       --ֻ��Ĺ�������
CDG.targetOwer = "����" --ֻ�����̹�

CDG.die.out = true --��������
--CDG.die.waittime = -1     --�����ȴ�ʱ��
CDG.die.maxCount = 0 --�����������������
CDG.savebank = false --false ����سǲ����

--CDG.back = { buypetRation = false, buypetHappy = false, fullprop = false, fullmate = false, fullbag = false } --�س�����
--CDG.overMapErr = true             --��ͼ��ƥ��������

AI_SetParameter("NEWOLD_daguai", 1) --�´��

if CDG.attackMode == "��ͨ����" or CDG.attackMode == "��������" then
    CDG.attackMode = "Ĭ��ģʽ"
end

-----------------------------------------------------------
-- ���ѭ����Ļص����������ƴ�ֽ���������true��������
-----------------------------------------------------------
function CDG_callback(...)
    local nComplete = GetMissionVariableByName(m_missionName, 0) --��ȡ�������ɶ�
    --MessageBox(nComplete)
    if nComplete ~= 0 then
        return true --��Ϊ0������true��������
    end
    return false
end
CDG.callfun = CDG_callback --��ѭ����Ļص�������ֵ

-----------------------------------------------------------
-- �߼�
-----------------------------------------------------------
function _SMain(...)
    while true do
        local nComplete = GetMissionVariableByName(m_missionName, 0) --��ȡ�������ɶ�
        if nComplete == -1 then --û�д�����
            if IsHuodongComplete(m_missionName, 1) then
                DebugMessage(m_missionName .. " ���������Ѿ����")
                break
            else
                MoveToNPC(m_npc[1].x, m_npc[1].y, m_npc[1].sceneID, m_npc[1].name, nil, true, nil, false, false)
                Sleep(600)
                QuestFrameOptionClicked_Item("#{JXMR_171027_06}", 1, 500) --��ˣ���������
                QuestFrameAcceptClicked()
                Sleep(600)
            end
        elseif nComplete == 0 then --�ѽ�����δ���
            CDG:OnStart() --��ʼ���
        elseif nComplete == 1 then --�ѽ������Ѿ����
            DelBagItem(-1) --���
            Skill:UseSkillByName("��������", -1, 300) --����
            MoveToNPC(m_npc[1].x, m_npc[1].y, m_npc[1].sceneID, m_npc[1].name, nil, true, nil, false, false)
            Sleep(600)
            QuestFrameOptionClicked_Item("#{JXMR_171027_06}", 1, 500) --��ˣ���������
            QuestFrameMissionComplete()
            Sleep(500)
        end
        DebugStr("������˾�������...")
        Sleep(200)
    end
end

-----------------------------------------------------------
-- �����⽻������Ϊ��ʱ���ǴӶ�ʱ�����ģ���ֹ��
-----------------------------------------------------------
function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("������Ʒ���ƣ� [" .. value.."]");
			-- �ȴ�(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
	
end

-----------------------------------------------------------
-- �жϱ�������Ľű�
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
-- ���ĵ���
-----------------------------------------------------------
-- �ж��û��Ƿ���Ҫ�μ����� 
for key,value in ipairs(players) do
	local playName = GetPlayerInfo("NAME");
	PushDebugMessage(playName);
    if playName == value then
        -- �������û��������ֱ��ִ����������� 
        local bags = judgeBagIsEmpty();
        if bags[bag1] > 27 then
            for i = 1,6 do
                destroyItem();
            end
        end

		_SMain()
		--�س�
		MoveTo(155, 155, 580, nil, nil, nil)
		Sleep(1000)
    end
end


MoveToNPC(340,210,1,"����")
