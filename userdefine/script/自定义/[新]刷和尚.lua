--[[
    �ű����ܣ��Զ�������ĺ���
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
local currentDay = os.date("%H:%M")
local monkTime = {"10:45","16:30","21:30","23:00"};
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
------------------------------------------------------
-- �����������
------------------------------------------------------
local pos = {
	{"����",18,116,269},
	{"����",18,246,47},
	{"����",24,242,248},
	{"����",24,132,258},
	{"����",30,222,134},
	{"����",30,153,132},
};

------------------------------------------------------
-- ���������е���Ϸ�������ơ�һ��Ϊһ�Ӻţ����Ⱥ�˳��
-- �޶�Ա�������ƣ���ǰһ�ж�Ӧ������������λ�ã���
------------------------------------------------------
LoadScript("allPlayers.lua")


------------------------------------------------------
-- �ȴ�ִ���ҵ��Ѱ·����
------------------------------------------------------
function waitForPlayers()
	-- ������ʶ�ǵڼ��Ӻ�
	local num = 0
	for key,value in ipairs(monkPlayers) do
		if playName == value then
			num = math.ceil( key/6 )
			PushDebugMessage("#eDC4C18#cFFFF00 ׼��ȥ����ˢ���е�ͼ".. pos[num][1].."����Ϊ��"..pos[num][3]..","..pos[num][4]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			if xpos.. "|" .. ypos ~= pos[num][3].. "|" .. pos[num][4] then
				MoveTo(pos[num][3],pos[num][4],pos[num][2]);
				Sleep(1000)
				break;
			end
		end
	end
end

------------------------------------------------------
-- �ӳ��Ÿ���
------------------------------------------------------
function judgeTeamer(time)
	if  IsLeader() == 1 then
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
	LoadScript("�ؾ���(����)")
end

-- 
------------------------------------------------------
-- ���ĵ���
------------------------------------------------------
waitForPlayers()
while true do
	local now=os.date("%H:%M");
	--ȡ��Χ�Ķ����Ա,�����Լ�
	--	����ֵ1��������		��Χ�����Ա����
	--	����ֵ2����Ա����   
	--	����1����Χ�ķ�Χ����
	local nCount,tObj = Team:GetSurroundMember(5)
	Sleep(500)
	PushDebugMessage("#eDC4C18#cFFFF00 �����Ѿ�����" .. nCount .. "��")
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