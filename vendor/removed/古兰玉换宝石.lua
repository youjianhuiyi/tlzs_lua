PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
local monkTime1 = "10:45";
local monkTime2 = "16:30";
local monkTime3 = "21:30";
local monkTime4 = "23:00";

function waitForPlayers()
     playName = GetPlayerInfo("NAME");
     -- players = {
        -- {"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
        -- {"Se��ʅ�Z��Y","����Ӱ��","�� �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
        -- {"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
        -- {"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"},
        -- {"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
		-- };
		
		-- ���players�����н�ɫ�����뵱ǰ��Ϸ��ɫ����һ��ʱ����ִ��ʥ��ɽˢ��
		-- �������ϸ�ʽ������Χһ�Դ����Ű����������һ������������������Ҫ�ô����Ű����ŷ�������Χ�Ĵ���������
		-- һ�Ӻ�������һ�Ӻ�֮ǰ�Ĵ�����֮����Ӣ�Ķ��Ÿ���
		-- �˷�����������������Ҫ���ֲ�ͬ��ɫ��Ҫִ�в�ͬ�����Ĺ���
		
	pos = {
		{"����",242,248},
		{"����",132,258},
		{"����",61,197},
		{"����",79,248},
		{"����",268,168},
		{"����",239,123}
	};
	
	players = {
		{"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
        {"Se��ʅ�Z��Y","����Ӱ��","�� �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
        {"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�","Eternally��L"},
        {"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"},
        {"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"}
	};
	
	for key,value in ipairs(players)
	do
		for key1,value1 in ipairs(value)
		do
			if playName == value1 then
				PushDebugMessage("׼��ȥ����ˢ������ʥ��ɽ"..pos[key][2]..","..pos[key][3]);
				Sleep(80)
				��ͼѰ·(pos[key][1],pos[key][2],pos[key][3]);
				local xpos,ypos = Player_GetPos();
				while true do
					if xpos ~= pos[key][2] and ypos ~= pos[key][3] then
						��ͼѰ·(pos[key][1],pos[key][2],pos[key][3]);
					else
						break;
					end
				end
			end
		end
	end
	
end



function readyExecAttackPig(now)
	local xpos,ypos = Player_GetPos();
	if now > "10:40" and now < monkTime1 then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ��".. monkTime1 .. "׼����ʼˢ��");
		�ȴ���ָ��ʱ��(monkTime1);
		ִ�нű�("�ؾ���(����)");
		return true;
	elseif now > "16:25" and now < monkTime2 then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ��".. monkTime2 .. "׼����ʼˢ��");
		�ȴ���ָ��ʱ��(monkTime2);
		ִ�нű�("�ؾ���(����)");
		return true;
	elseif now > "21:25" and now < monkTime3 then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ��".. monkTime3 .. "׼����ʼˢ��");
		�ȴ���ָ��ʱ��(monkTime3);
		ִ�нű�("�ؾ���(����)");
		return true;
	elseif now > "22:55" and now < monkTime4 then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ��".. monkTime4 .. "׼����ʼˢ��");
		�ȴ���ָ��ʱ��(monkTime4);
		ִ�нű�("�ؾ���(����)");
		return true;
	else
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ��ʱ�䷶Χ��");
		waitForPlayers();
		return false;
	end
end

-- local MapName = GetActiveSceneName()
-- local MapID  = GetSceneID()
-- PushDebugMessage(MapName)
-- PushDebugMessage(MapID)

--������һ���NPC
-- local xpos,ypos = Player_GetPos()
-- local Obj = Enum2XAllObj()
-- for i = 1, 10 do
    -- id name class title x y dst hp guid menpai state level target
    -- MessageBox(Obj[i].name);Sleep(200)
    -- MessageBox(Obj[i].class);Sleep(200)
	-- MessageBox(Obj[i].title);Sleep(200)
	-- MessageBox("x����" .. Obj[1].x);Sleep(200)
	-- MessageBox("y����" .. Obj[1].y);Sleep(200)
	-- MessageBox(Obj[i].dst);Sleep(200)
	-- MessageBox(Obj[i].hp);Sleep(200)
	-- MessageBox(Obj[i].guid);Sleep(200)
	-- MessageBox(Obj[i].menpai);Sleep(200)
	-- MessageBox(Obj[i].state);Sleep(200)
	-- MessageBox(Obj[i].level);Sleep(200)
	-- MessageBox(Obj[i].target);Sleep(200)
-- end


while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ".. os.date("%H:%M:%S"));	
	local result = readyExecAttackPig(now);
	if result == true then 
		break;
	else
		readyExecAttackPig(now);
	end
end
