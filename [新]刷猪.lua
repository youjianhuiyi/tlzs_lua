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
local players = {
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f",
	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�",
	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����",
	"Se��ʅ�Z��Y","����Ӱ����","�nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������",
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
	"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia",
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
			PushDebugMessage("׼��ȥ����ˢ������ʥ��ɽ"..pos[num][1]..","..pos[num][2]);
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


function judgeTeamer(time)
	if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
		Player_TeamFollow(true) --��Ӹ���
		Sleep(500)
	end
	local str1 = time;
	local str2 = os.date("%H:%M:%S");
	local h1,m1,s1 = string.match(str1,"(%d+):(%d+):(%d+)")
	local h2,m2,s2 = string.match(str2,"(%d+):(%d+):(%d+)")
	local time1 = h1*3600+m1*60+s1
	local time2 = h2*3600+m2*60+s2
	local time3 = (time - time2)*1000
	Sleep(time3)
	ִ�нű�("Ұ����(ʥ��ɽ)")
end

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
			PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
		end
		break
	else
		waitForPlayers()
	end
end


