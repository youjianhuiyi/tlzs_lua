--[[
    �ű����ܣ�ÿ�Ӻ��Զ����׽�Ҹ��ӳ��ţ���ע�⣺��Ҫ�����жӳ��ż����ϰ���б�ͬʱ�Զ�������Ҫ���ù̶��������꣬������Ʒ��ʱ����Ҫ���׽�ҡ� 
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local playerName = GetPlayerInfo("NAME");
local num = 0; -- ��������
LoadScript('allPlayers.lua');
-----------------------------------------------------------
-- �ֿ�ȡ���
-----------------------------------------------------------
function bankGetMoneyToLeaderPlayer()
    --֧�����븺�� ����local nNeedMoney = -5*10000,��ʾ�ֿ�ֻ����5������ȫ��ȡ����,�����ڽ������ҽ��׸��ϰ�
    -- Ĭ��ȡ5J �Լ����޸�
    local nNeedMoney = -1
    --����Ŀ�������Ҫ��
    PushDebugMessage("ǰ�������Զ�ȡǮ,��һͭ����")
    Bank_GetMoney(nNeedMoney)
end

-----------------------------------------------------------
-- �ϰ��ȥָ������ִ�н���
-----------------------------------------------------------
function leaderPlayerDo()
    for k,v in ipairs(leaderPlayers) do
        if v == playerNmae then
            LoadScript("�ϰ�ŵȴ�����");
            break;
        else
            LoadScript("�����ϰ��");
            break;
        end
    end
    return false;
end


-----------------------------------------------------------
-- ���ĵ���
-----------------------------------------------------------
bankGetMoneyToLeaderPlayer();
leaderPlayerDo();