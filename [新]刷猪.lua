PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���ؽ�һ�Σ�������");
--local pigTime1 = "14:00";
--local pigTime2 = "21:50";
pigTime = {"14:00","21:50"}
playName = GetPlayerInfo("NAME");
activeScene = GetActiveSceneName()
------------------------------------------------------
-- ����������
------------------------------------------------------
local pos = {
	{119,120},{26,32},{133,48},{198,63},{155,96}
};

------------------------------------------------------
-- ������������Ϸ�������ơ�һ��Ϊһ�Ӻţ����Ⱥ�˳��
-- �޶�Ա�������ƣ���ǰһ�ж�Ӧ������������λ�ã���
------------------------------------------------------
local players = {
	{"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
	{"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
	{"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
	{"Se��ʅ�Z��Y","����Ӱ����","�nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
	{"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"},
	{"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"},
	--{"����һ��ؼ"}
};
	

------------------------------------------------------
-- �ȴ�ִ���ҵ��Ѱ·����
------------------------------------------------------
function waitForPlayers()
	-- ������ʶ�ǵڼ��Ӻ�
	local num = 0
	for key,value in ipairs(players)
	do
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

		if playName == value then
			PushDebugMessage(value)
			PushDebugMessage("׼��ȥ����ˢ������ʥ��ɽ"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			while true do
				if xpos..ypos ~= pos[num][1]..pos[num][2] then
					��ͼѰ·("ʥ��ɽ",pos[num][1],pos[num][2]);break;
				else
					break;
				end
			end
		end
	end
	
end

------------------------------------------------------
-- ���ķ���֮һ��ִ��ˢ��
------------------------------------------------------
function execPig(times)

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
	--ִ�нű�("Ұ����(ʥ��ɽ)");
end

------------------------------------------------------
-- ���ķ�����ִ��ˢ��
------------------------------------------------------
function readyExecAttackPig(now)
	local xpos,ypos = Player_GetPos();
	if now > "13:58" and now < "14:20" then
		execPig(pigTime[1])
	elseif now > "21:45" and now < "22:15" then
		execPig(pigTime[2])
	else
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ��ʱ�䷶Χ��,ִ���¸�����");
		return false
	end
end


------------------------------------------------------
-- ѭ������ִ��ˢ���������Ϊfalse��ʱ���ֹͣ
------------------------------------------------------
while true do
	local now=os.date("%H:%M");
	PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��Ϊ".. os.date("%H:%M:%S"));	
	local result = readyExecAttackPig(now);
	if result == false then 
		break;
	else
		readyExecAttackPig(now);
	end
end

--waitForPlayers()