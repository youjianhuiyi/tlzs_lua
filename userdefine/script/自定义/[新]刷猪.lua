--[[
    �ű����ܣ��Զ��������ˢ��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���ؽ�һ�Σ�������");
local pigTime = {"14:00","21:50"}
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
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
LoadScript("allPlayers.lua");

------------------------------------------------------
-- �ȴ�ִ���ҵ��Ѱ·����
------------------------------------------------------
function waitForPlayers()
	-- ������ʶ�ǵڼ��Ӻ�
	local num = 0
	for key,value in ipairs(players)
	do
		if playName == value then
			num = math.ceil( key/6 )
			PushDebugMessage("#eDC4C18#cFFFF00 ׼��ȥ����ˢ������ʥ��ɽ"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			if xpos.. "|" .. ypos ~= pos[num][1].. "|" .. pos[num][2] then
				��ͼѰ·("ʥ��ɽ",pos[num][1],pos[num][2]);
				Sleep(1000)
				break;
			end
		end
	end
end

------------------------------------------------------
-- �����������
------------------------------------------------------
function judgeTeamer(time)
	if IsLeader() == 1 then
		Player_TeamFollow(true) --��Ӹ���
		Sleep(500)
	end
	local str1 = time;
	local str2 = os.date("%H:%M:%S");
	local h1,m1,s1 = string.match(str1,"(%d+):(%d+):(%d+)")
	local h2,m2,s2 = string.match(str2,"(%d+):(%d+):(%d+)")
	local time1 = h1*3600+m1*60+s1
	local time2 = h2*3600+m2*60+s2
	local time3 = (time1 - time2 - 2)*1000
	Sleep(time3)
	LoadScript("Ұ����(ʥ��ɽ)")
end



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
	local nCount,tObj = Team:GetSurroundMember(15)
	if nCount == 6 then
		if now > "13:50" and now < "14:20" then
			judgeTeamer("14:00:00")
		elseif now > "21:50" and now < "22:15" then
			judgeTeamer("21:30:00")
		else
			Player_TeamFollow(true)
			PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
		end
		break
	else
		waitForPlayers()
	end
end


