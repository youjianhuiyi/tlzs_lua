--[[
    脚本功能：每队号自动交易金币给队长号，『注意：需要将所有队长号加入老板号列表，同时自动交易需要设置固定交易坐标，交易物品的时候需要交易金币』 
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

local playerName = GetPlayerInfo("NAME");
LoadScript('allPlayers.lua');
-----------------------------------------------------------
-- 仓库取金币
-----------------------------------------------------------
function bankGetMoneyToLeaderPlayer()
    local nNeedMoney = -1
    --下面的看不懂不要改
    PushDebugMessage("#eDC4C18#cFFFF00 #1 前往银行自动取钱,留一铜翻本")
    Bank_GetMoney(nNeedMoney)
end

-----------------------------------------------------------
-- 老板号去指定坐标执行交易
-----------------------------------------------------------
function leaderPlayerDo()
    for k,v in ipairs(leaderPlayers) do
        if v == playerNmae then
            LoadScript("老板号等待交易");
            break;
        else
            LoadScript("交易老板号");
            break;
        end
    end
    return false;
end


-----------------------------------------------------------
-- 核心调用
-----------------------------------------------------------
bankGetMoneyToLeaderPlayer();
leaderPlayerDo();