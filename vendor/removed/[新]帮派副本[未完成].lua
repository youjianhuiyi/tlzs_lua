PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ�����ߵ�NPC�����븱��ˢ��");
local activeScene = GetActiveSceneName()
local ShanYao_NPC = {}
local ShanGui_NPC = {}
AI_SetParameter("NEWOLD_daguai", 1) --�����´��ģʽ

-------------------------------------------------------
-- ��ḱ��NPCѰ�ҵ�·��
-------------------------------------------------------
local findNPC = {
	{73,146},
	{74,126},
	{119,153},
	{141,136},
	{97,119},
	{98,96},
	{65,99},
	{55,74},
	{49,55},
	{71,60},
	{98,79},
	{133,61},
	{147,46},
	{151,75},
	{137,100},
	{98,98},
	{99,58}
};

-------------------------------------------------------
--���а�����
-------------------------------------------------------
local city = {
	{18,102,36,'��������Уξ'},
	{18,283,113,'��������Уξ'},
	{18,72,284,'��������Уξ'},
	{19,234,24,'�㱱����Уξ'},
	{19,116,29,'�㱱����Уξ'},
	{19,32,128,'�㱱����Уξ'},
	{20,97,281,'��ԭ����Уξ'},
	{20,271,191,'��ԭ����Уξ'},
	{20,66,202,'��ԭ����Уξ'},
	{21,277,258,'��������Уξ'},
	{21,75,35,'��������Уξ'},
	{21,40,142,'��������Уξ'},
	{22,216,282,'��������Уξ'},
	{22,39,63,'��������Уξ'},
	{22,280,154,'��������Уξ'},
	{23,253,285,'��������Уξ'},
	{23,28,54,'��������Уξ'},
	{23,290,115,'��������Уξ'},
	{24,285,166,'��������Уξ'},
	{24,173,283,'��������Уξ'},
	{24,34,100,'��������Уξ'},
	{25,37,172,'��ɽ����Уξ'},
	{25,294,153,'��ɽ����Уξ'},
	{25,146,284,'��ɽ����Уξ'},
	{26,226,36,'ʯ�ֶ���Уξ'},
	{26,278,281,'ʯ������Уξ'},
	{26,45,177,'ʯ������Уξ'},
	{27,33,251,'��Ϫ����Уξ'},
	{27,177,39,'��Ϫ����Уξ'},
	{27,197,280,'��Ϫ����Уξ'},
	{28,96,42,'��گ����Уξ'},
	{28,272,240,'��گ����Уξ'},
	{28,39,254,'��گ����Уξ'},
	{29,250,45,'�置����Уξ'},
	{29,37,251,'�置����Уξ'},
	{29,281,160,'�置����Уξ'},
	{30,45,267,'��������Уξ'},
	{30,261,231,'��������Уξ'},
	{30,39,139,'��������Уξ'},
	{31,218,282,'��Ȫ����Уξ'},
	{31,63,33,'��Ȫ����Уξ'},
	{31,35,121,'��Ȫ����Уξ'},
	{32,254,38,'���Ķ���Уξ'},
	{32,113,280,'��������Уξ'},
	{32,92,172,'��������Уξ'},
	{33,271,37,'÷�붫��Уξ'},
	{33,31,90,'÷������Уξ'},
	{33,282,236,'÷������Уξ'},
	{34,292,58,'�Ϻ�����Уξ'},
	{34,108,227,'�Ϻ�����Уξ'},
	{34,134,40,'�Ϻ�����Уξ'},
	{35,273,52,'���ݶ���Уξ'},
	{35,243,150,'��������Уξ'},
	{35,80,139,'��������Уξ'}
};

---------------------------------
--- �Զ�Ѱ·��ָ�����
---------------------------------
function autoMoveToGuild( sceneName,position )
	for k, v in ipairs(city) do
		print(k..'----'..v);
	end
	--MoveToNPC(param.x, param.y, param.sceneID, param.name, nil, use_horse, call_back_run)
	-- PushDebugMessage(city.)
	-- MoveToNPC();
end

autoMoveToGuild();
---------------------------------
--- ˢ�ֵ�����㣬��˳���������ˢ
---------------------------------
local position = {
	{72,97},
	{51,92},
	{58,92},
	{43,67},
	{46,48},
	{48,54},
	{65,57},
	{141,54},
	{136,100},
	{130,100},
	{99,44},
};


-------------------------------------------------------
-- ѭ������ɽ������ɽ��
-------------------------------------------------------
function findNPC()
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name);
		if value.class == "NPC" and value.name == "ɽ��" then
			ShanYao_NPC[key] = {value.name , value.class , value.x , value.y , value.dst}
		else
			ShanGui_NPC[key] = {value.name , value.class , value.x , value.y , value.dst}
		end
	end
end

-----------------------------------------------------------
-- ������������������ǰ����û�й����ʱ�����������ˢ��
-----------------------------------------------------------
function callback(xpos,ypos)
	local count = 0
	local Obj = Enum2XAllObj()
	for key,value in ipairs(Obj) do
		PushDebugMessage(key .. " --- " .. value.name);
		if value.class == "����" or value.hp ~= 0 then
			count = count + 1
		end
	end
	
	while true do 
		PushDebugMessage("��ǰcount����ֵΪ��"..count);Sleep(500)
		if count == 0 then
			return false
		else
			return true
		end
	end
end

------------------------------------------------------
-- �����ֽű�
------------------------------------------------------
function DaGuai(xpos,ypos)
	DG_OnInit();
	DG_SetParam("��ַ�ʽ", "���̺��");
	DG_SetParam("����ģʽ", "�����̹�");
	DG_SetParam("Ŀ��","����");
	DG_SetParam("�Ƿ�ѡ�й�", true);
	DG_SetParam("�������", "�����");
	DG_SetParam("��ַ�Χ", 15);
	DG_SetParam("����", "��ֵ", { {x=xpos,y=ypos}});
	DG_SetParam("��ͼ", -1);
	DG_SetParam("�Ƿ񹥻�", true);
	DG_SetParam("��������", { usehorse = false, usepet = true, dxys = false });
	while true do
		DG_OnAction();Sleep(500)
		PickUp();Sleep(500)
		if callback(xpos,ypos) == false then
			break
		end
	end
	return nil
end


-------------------------------------------------------
-- ����ɽ��ɽ����
-------------------------------------------------------
function enterNPC()

	if activeScene == "�Ų�����" then
		-- ��ɽ��
		findNPC()
		for k_enter,v_enter in ipairs(ShanYao_NPC) do
			if v_enter[3] ~= nil or v_enter[4] ~= nil then
				MoveToNPC(v_enter[3],v_enter[4],-1,v_enter[1]);Sleep(1500)
			end
		end
	else
		-- ��ɽ��
		findNPC()
		for k_enter,v_enter in ipairs(ShanGui_NPC) do
			if v_enter[3] ~= nil or v_enter[4] ~= nil then
				MoveToNPC(v_enter[3],v_enter[4],-1,v_enter[1]);Sleep(1500)
			end
		end
	end
	
end


-- for k2,v2 in ipairs(position) do 
-- 	DaGuai(v2[1],v2[2])
-- 	Sleep(2000)
-- end