PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
local currentDay = os.date("%H:%M")
local monkTime = {"10:45","16:30","21:30","23:00"};
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
------------------------------------------------------
-- �����������
------------------------------------------------------
local pos = {
	{"����",116,269},
	{"����",246,47},
	{"����",242,248},
	{"����",132,258},
	{"����",222,134},
	{"����",153,132},
};

------------------------------------------------------
-- ���������е���Ϸ�������ơ�һ��Ϊһ�Ӻţ����Ⱥ�˳��
-- �޶�Ա�������ƣ���ǰһ�ж�Ӧ������������λ�ã���
------------------------------------------------------
players = {
	"ɽ�ǡ��۸�","��˳ݪ��","���ϴ�ú�ϻ�","���@�n�����f","���������졨","�h��",
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
			else
				num = 1
			end
			
			PushDebugMessage("׼��ȥ����ˢ���е�ͼ".. pos[num][1].."����Ϊ��"..pos[num][2]..","..pos[num][3]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			if xpos.. "|" .. ypos ~= pos[num][2].. "|" .. pos[num][3] then
				��ͼѰ·(pos[num][1],pos[num][2],pos[num][3]);
				Sleep(1000)
				break;
			end
		end
	end
end


function judgeTeamer(time)
	if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "�t�A��Ƥ���~" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
		Player_TeamFollow(true) --��Ӹ���
		Sleep(500)
	end
	local str1 = time;
	local str2 = os.date("%H:%M:%S");
	local h1,m1,s1 = string.match(str1,"(%d+):(%d+):(%d+)")
	local h2,m2,s2 = string.match(str2,"(%d+):(%d+):(%d+)")
	local time1 = h1*3600+m1*60+s1
	local time2 = h2*3600+m2*60+s2
	time3 = (time1 - time2 - 2)*1000
	Sleep(time3)
	ִ�нű�("�ؾ���(����)")
end

-- ���ĵ���
waitForPlayers()
while true do
	local now=os.date("%H:%M");
	--ȡ��Χ�Ķ����Ա,�����Լ�
	--	����ֵ1��������		��Χ�����Ա����
	--	����ֵ2����Ա����   
	--	����1����Χ�ķ�Χ����
	local nCount,tObj = Team:GetSurroundMember(5)
	Sleep(500)
	PushDebugMessage("�����Ѿ�����" .. nCount .. "��")
	Sleep(500)
	if nCount == 6 then
		if now >= "10:40" and now <= "11:00" then
			judgeTeamer("10:45:00")
		elseif  now >= "16:25" and now <= "16:45" then
			judgeTeamer("16:30:00")
		elseif  now >= "21:00" and now <= "21:43" then
			judgeTeamer("21:30:00")
		elseif now >= "22:55" and now <= "23:15" then
			judgeTeamer("23:00:00")
		else
			Player_TeamFollow(true)
			PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
		end
		break;
	else
		waitForPlayers()
	end
end