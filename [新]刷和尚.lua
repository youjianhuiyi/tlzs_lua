PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
local currentDay = os.date("%H:%M")
local monkTime = {"20:40","16:30","21:30","23:00"};
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
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
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f",
	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�",
	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����",
	"Se��ʅ�Z��Y","����Ӱ����","�nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������",
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
	"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"
};
------------------------------------------------------
-- �ȴ�ִ���ҵ��Ѱ·����
------------------------------------------------------
function waitForPlayers()
	-- ������ʶ�ǵڼ��Ӻ�
	local num = 0
	for key,value in ipairs(players)
	do
		if playName == value then
			if key >= 1 and key <= 6 then
				num = 1
			elseif key >= 7 and key <= 12 then
				num = 2
			elseif key >= 13 and key <= 18 then
				num = 3
			elseif key >= 19 and key <= 24 then
				num = 4
			elseif key >= 25 and key <= 30 then
				num = 5
			elseif key >= 31 and key <= 36 then
				num = 6
			end
			PushDebugMessage(value)
			PushDebugMessage("׼��ȥ����ˢ���е�ͼ".. pos[num][1].."����Ϊ��"..pos[num][2]..","..pos[num][3]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			while true do
				if xpos.. "|" .. ypos ~= pos[num][2].. "|" .. pos[num][3] then
					��ͼѰ·(pos[num][1],pos[num][2],pos[num][3]);
					Sleep(1000)
					break;
				else
					break;
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
	if times >= "10:44" and times <= "11:00" then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. times .. "�Ѿ���ʼˢ���ˣ��Ͽ����");
		return false
	elseif  times >= "16:29" and times <= "17:45" then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. times .. "�Ѿ���ʼˢ���ˣ��Ͽ����");
		return false
	elseif  times >= "21:29" and times <= "21:40" then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. times .. "�Ѿ���ʼˢ���ˣ��Ͽ����");
		return false
	elseif times >= "22:59" and times <= "23:15" then
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. times .. "�Ѿ���ʼˢ���ˣ��Ͽ����");
		return false
	else
		�ȴ���ָ��ʱ��(times);
		return false
	end
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
	PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ".. os.date("%H:%M"));	
	local result = readyExecAttackMonk(now);
	if result == false then
		break;
	else
		readyExecAttackMonk(now);
	end
end