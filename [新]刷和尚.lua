PushDebugMessage("#eDC4C18#cFFFF00 #81ȫ�¶��ư汾ˢ���У��ؽ�һ�Σ�������");
local currentDay = os.date("%H:%M")
local monkTime = {"10:45","16:30","21:30","23:00"};
local playName = GetPlayerInfo("NAME");
local activeScene = GetActiveSceneName()
------------------------------------------------------
-- �����������
------------------------------------------------------
local pos = {
	{"����",268,168},
	{"����",239,123},
	{"����",242,248},
	{"����",132,258},
	{"����",61,197},
	{"����",79,248},
};

------------------------------------------------------
-- ���������е���Ϸ�������ơ�һ��Ϊһ�Ӻţ����Ⱥ�˳��
-- �޶�Ա�������ƣ���ǰһ�ж�Ӧ������������λ�ã���
------------------------------------------------------
players = {
	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����",
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f",
	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�",
	"Se��ʅ�Z��Y","����Ӱ����","�nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������",
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
					return true;
				end
			end
		end
		return false;
	end
end



--ȡ��Χ�Ķ����Ա,�����Լ�
--	����ֵ1��������		��Χ�����Ա����
--	����ֵ2����Ա����   
--	����1����Χ�ķ�Χ����
local nCount,tObj = Team:GetSurroundMember(15)

waitForPlayers()
local now=os.date("%H:%M");
--{"14:00","22:50"}
while true do
	if nCount == 6 then
		if now >= "10:45" and now <= "11:00" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		elseif  now >= "16:30" and now <= "16:45" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		elseif  now >= "21:30" and now <= "21:43" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		elseif now >= "23:00" and now <= "23:15" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		else
			PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
			break
		end
	else
		waitForPlayers()
	end
end