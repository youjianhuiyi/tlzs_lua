local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 离火 精金石 精金石碎片 九天玉碎 玉华灵泉 命魂玉 伏羲玉 缀龙石·元 缀龙石·伤 缀龙石·暴 龙纹玉灵 铸纹血玉 紫微灵魄 金蚕丝 ", 31,0)


function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "张士心" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(350,229,1,"张士心");Sleep(1500)
				QuestFrameOptionClicked("凝元",1); Sleep(500)
			end
			return true
		end
	end
end
checkNPCDst();