--[[
    脚本功能：取绑定离火，真元，天外的物品，进行游戏角色的打造。用于日常整理仓库背包，将绑定的物品使用完
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 离火 精金石 精金石碎片 九天玉碎 玉华灵泉 命魂玉 伏羲玉 缀龙石·元 缀龙石·伤 缀龙石·暴 龙纹玉灵 铸纹血玉 紫微灵魄 金蚕丝 ", 31,0)

---------------------------------------------------------------------
-- 检测身边是否有 NPC
---------------------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "张士心" and tonumber(tmp.dst) <= 3 then
			return true
		else
			MoveToNPC(350,229,1,"张士心");Sleep(500)
			QuestFrameOptionClicked("凝元",1); Sleep(500)
			return true
		end
	end
end

---------------------------------------------------------------------
-- 检测身边是否有 NPC
---------------------------------------------------------------------
checkNPCDst();