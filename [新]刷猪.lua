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
			PushDebugMessage(value)
			PushDebugMessage("׼��ȥ����ˢ������ʥ��ɽ"..pos[num][1]..","..pos[num][2]);
			Sleep(500)
			local xpos,ypos = Player_GetPos();
			PushDebugMessage(xpos.."--"..ypos)
			while true do
				if xpos.. "|" .. ypos ~= pos[num][1].. "|" .. pos[num][2] then
					��ͼѰ·("ʥ��ɽ",pos[num][1],pos[num][2]);
					Sleep(1000)
					break;
				else
					break;
				end
			end
		end
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
		if now > "13:50" and now < "14:20" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		elseif now > "21:50" and now < "22:15" then
			if playName == "��������" or  playName == "��Ҽ�~�u�ͤ�" or  playName == "ƽ����" or  playName == "Se��ʅ�Z��Y" or  playName == "�����S�O����" or  playName == "��Lynthia" then
				Player_TeamFollow(true) --��Ӹ���
			end
			break
		else
			PushDebugMessage("#eDC4C18#cFFFF00 ��ǰʱ��".. now .. "����ˢ����ʱ�䷶Χ��,ִ���¸�����");
		end
	else
		waitForPlayers()
	end
end


