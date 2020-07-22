PushDebugMessage("----------本脚本由QQ392338219编写----------")
珍兽名字 = {"一","二"}
技能 = {"迟钝","移魂","瞬影","强身","猛击"}
function 购买技能书(name)
-- 迟钝1 移魂8 瞬影9 强身10 猛击12
	local index = -1
	if name == 技能[1] then
		index = 1
	elseif name == 技能[2] then
		index = 8
	elseif name == 技能[3] then
		index = 9
	elseif name == 技能[4] then
		index = 10
	elseif name == 技能[5] then
		index = 12
	end
	GetLuaValue(string.format("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(%d);",index))
end
function 查找珍兽(petName)
		return GetLuaValue(string.format([[
		    local nPetCount = Pet : GetPet_Count();
		    if nPetCount == 0  then
			   return -1
			end
		    
			for k = 0, 9 do
				if Pet:IsPresent(k) then
					local strName,strName2 = Pet:GetName(k)
					if string.find("%s", strName) then
						return k;
					end
				end
			end			
			return -1			
		]], petName), "n",1);		
end
function 找物品(name)
	local ID = -1
	if name == 技能[1] then
		ID = 30402005
	elseif name == 技能[2] then
		ID = 30402013
	elseif name == 技能[3] then
		ID = 30402015
	elseif name == 技能[4] then
		ID = 30402017
	elseif name == 技能[5] then
		ID = 30402071
	end
	local x nIndex = GetLuaValue(string.format("return  PlayerPackage:FindFirstBindedItemIdxByIDTable(tonumber(%d));",ID),"nn",2);Sleep(100)
	return nIndex 
end
function 学习技能(g_selidx , g_pidx)
	GetLuaValue(string.format("Pet:SkillStudy_Do( 1, %d, %d )",g_selidx , g_pidx))
end
function 找珍兽技能(g_selidx,skillName)

		local index, SkillID = GetLuaValue(string.format([[
		    local nPetCount = Pet : GetPet_Count();
		    if nPetCount == 0  then
			   return -1, -1
			end
			    local i = 1
			    while i <= 12 do
				    local theSkillAction = Pet:EnumPetSkill(%d, i-1, "petskill")
					i = i+1
					local SkillID = theSkillAction:GetID();
					if SkillID ~= 0 then					
					   if string.find(theSkillAction:GetName(), "%s") then
					       return 1, SkillID;
					   end
					end				
				end	
			return -1, -1			
		]], g_selidx,skillName), "nn",2);
		if index > 0 then
			return true
		else
			return false
		end
end
-- 跨图寻路("洛阳",275,293)
-- TalkNpc("云涵儿");Sleep(1000)
MoveToNPC(275,293,0,"云涵儿");Sleep(1000)
QuestFrameOptionClicked("购买珍兽技能书",1);Sleep(1000)
if Show_Window("Shop") then	
	GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Pet_Clicked()");Sleep(1000)
end
for i=1,#珍兽名字 do
	local PetIndex = 查找珍兽(珍兽名字[i])
	if PetIndex < 0 then
		PushDebugMessage("没有找到该名字珍兽,请确认没有输错!")
		return
	end
	local z = 0
	while true do
		for i = 1 , 5 do
			if not 找珍兽技能(PetIndex,技能[i]) then
				local ItemIndex = 找物品(技能[i])
				if ItemIndex < 0 then
					购买技能书(技能[i]);Sleep(1000)
				else
					学习技能(PetIndex,ItemIndex);Sleep(300)
				end
				z = 0
			else
				z = z + 1	
			end
			if z > 10 then
				PushDebugMessage("技能都已上好,结束脚本")
				break
			end
		end
		if z > 10 then
			break
		end
	end
end