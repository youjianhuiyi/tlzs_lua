PushDebugMessage("----------���ű���QQ392338219��д----------")
�������� = {"һ","��"}
���� = {"�ٶ�","�ƻ�","˲Ӱ","ǿ��","�ͻ�"}
function ��������(name)
-- �ٶ�1 �ƻ�8 ˲Ӱ9 ǿ��10 �ͻ�12
	local index = -1
	if name == ����[1] then
		index = 1
	elseif name == ����[2] then
		index = 8
	elseif name == ����[3] then
		index = 9
	elseif name == ����[4] then
		index = 10
	elseif name == ����[5] then
		index = 12
	end
	GetLuaValue(string.format("setmetatable(_G, {__index = Shop_Env});GoodButton_Clicked(%d);",index))
end
function ��������(petName)
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
function ����Ʒ(name)
	local ID = -1
	if name == ����[1] then
		ID = 30402005
	elseif name == ����[2] then
		ID = 30402013
	elseif name == ����[3] then
		ID = 30402015
	elseif name == ����[4] then
		ID = 30402017
	elseif name == ����[5] then
		ID = 30402071
	end
	local x nIndex = GetLuaValue(string.format("return  PlayerPackage:FindFirstBindedItemIdxByIDTable(tonumber(%d));",ID),"nn",2);Sleep(100)
	return nIndex 
end
function ѧϰ����(g_selidx , g_pidx)
	GetLuaValue(string.format("Pet:SkillStudy_Do( 1, %d, %d )",g_selidx , g_pidx))
end
function �����޼���(g_selidx,skillName)

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
-- ��ͼѰ·("����",275,293)
-- TalkNpc("�ƺ���");Sleep(1000)
MoveToNPC(275,293,0,"�ƺ���");Sleep(1000)
QuestFrameOptionClicked("�������޼�����",1);Sleep(1000)
if Show_Window("Shop") then	
	GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Pet_Clicked()");Sleep(1000)
end
for i=1,#�������� do
	local PetIndex = ��������(��������[i])
	if PetIndex < 0 then
		PushDebugMessage("û���ҵ�����������,��ȷ��û�����!")
		return
	end
	local z = 0
	while true do
		for i = 1 , 5 do
			if not �����޼���(PetIndex,����[i]) then
				local ItemIndex = ����Ʒ(����[i])
				if ItemIndex < 0 then
					��������(����[i]);Sleep(1000)
				else
					ѧϰ����(PetIndex,ItemIndex);Sleep(300)
				end
				z = 0
			else
				z = z + 1	
			end
			if z > 10 then
				PushDebugMessage("���ܶ����Ϻ�,�����ű�")
				break
			end
		end
		if z > 10 then
			break
		end
	end
end