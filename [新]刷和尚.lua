PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
currentDay = os.date("%y:%m:%d")
monkTime = {"20:40","16:30","21:30","23:00"};
playName = GetPlayerInfo("NAME");
activeScene = GetActiveSceneName()
------------------------------------------------------
-- �����������
------------------------------------------------------
pos = {
	{"����",242,248},
	{"����",132,258},
	{"����",61,197},
	{"����",79,248},
	{"����",268,168},
	{"����",239,123}
};

------------------------------------------------------
-- ���������е���Ϸ�������ơ�һ��Ϊһ�Ӻţ����Ⱥ�˳��
-- �޶�Ա�������ƣ���ǰһ�ж�Ӧ������������λ�ã���
------------------------------------------------------
players = {
	{"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
	{"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
	{"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
	{"Se��ʅ�Z��Y","����Ӱ����","�nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
	{"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"},
	{"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"},
};
	

------------------------------------------------------
-- �ȴ�ִ���ҵ��Ѱ·����
------------------------------------------------------
function waitForPlayers()

	for key,value in ipairs(players)
	do
		for p_k1,p_v1 in ipairs(value)
		do
			if playName == p_v1 then
				PushDebugMessage(p_v1)
				PushDebugMessage("׼��ȥ����ˢ���е�ͼ".. pos[key][1].."����Ϊ��"..pos[key][2]..","..pos[key][3]);
				Sleep(500)
				local xpos,ypos = Player_GetPos();
				PushDebugMessage(xpos.."--"..ypos)
				while true do
					if xpos..ypos ~= pos[key][2]..pos[key][3] then
						��ͼѰ·(pos[key][1],pos[key][2],pos[key][3]);break;
					else
						break;
					end
				end
			end
		end
	end
	
end

------------------------------------------------------
-- ���ķ���֮һ��ִ��ˢ����
------------------------------------------------------
function execMonk(times)
	PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ��".. times .. "׼����ʼˢ����");
	for p_key,p_value in ipairs(pos) do
		PushDebugMessage(p_value[1])
		PushDebugMessage(activeScene)
		if activeScene == p_value[1] then
			ִ�нű�("[����] �س�")
			waitForPlayers();
			break
		else
			waitForPlayers();
			break
		end
	end
	�ȴ���ָ��ʱ��(times);
	--ִ�нű�("�ؾ���(����)");	
end

------------------------------------------------------
-- ���ķ�����ִ��ˢ����
------------------------------------------------------
function readyExecAttackMonk(now)
	local xpos,ypos = Player_GetPos();
	if now > "10:44" and now < "11:00" then
		execMonk(monkTime[1])
--	elseif now > "16:29" and now < "16:45" then
	elseif now > "16:29" and now < "17:45" then
		execMonk(monkTime[2])
	elseif now > "21:29" and now < "21:40" then
		execMonk(monkTime[3])
	elseif now > "22:59" and now < "23:15" then
		execMonk(monkTime[4])
	else
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
		return false
	end
end


------------------------------------------------------
-- ѭ������ִ��ˢ���У��������Ϊfalse��ʱ���ֹͣ
------------------------------------------------------
while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ".. os.date("%H:%M:%S"));	
	local result = readyExecAttackMonk(now);
	if result == false then 
		break;
	else
		readyExecAttackMonk(now);
	end
end
-- waitForPlayers()