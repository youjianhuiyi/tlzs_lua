DebugMessage("������[����]ҳ��Ķһ���ʯ,�ɶһ�����ʯͷ")

LoadScript("������һ���ʯ")

playName = GetPlayerInfo("NAME");
 -- players = {
	-- {"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
	-- {"Se��ʅ�Z��Y","����Ӱ����"," �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
	-- {"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
	-- {"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"},
	-- {"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
	-- {"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"}
	-- };
	
	-- ���players�����н�ɫ�����뵱ǰ��Ϸ��ɫ����һ��ʱ����ִ�о۱���
	-- �������ϸ�ʽ������Χһ�Դ����Ű����������һ������������������Ҫ�ô����Ű����ŷ�������Χ�Ĵ���������
	-- һ�Ӻ�������һ�Ӻ�֮ǰ�Ĵ�����֮����Ӣ�Ķ��Ÿ���
	-- �˷�����������������Ҫ���ֲ�ͬ��ɫ��Ҫִ�в�ͬ�����Ĺ���
	
	
-- Players1��ʾ��������
local Players1 = {""};
-- Players2��ʾ��������
local Players2 = {""};
--Players3��ʾ��������
local Players3 = {""};
--Players4��ʾ��������
local Players4 = {""};

PushDebugMessage("ǰ����������")
MoveToNPC(280, 320, LUOYANG_ID, "����")
Sleep(1000)

QuestFrameOptionClicked("������һ���ʯ")
Sleep(1000)


for key,value in ipairs(Players1) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 ѭ���һ� �ƾ�ʯ��1���� 5��")
		for i = 1, 5 do
			QuestFrameOptionClicked("�һ��ƾ�ʯ��1����")
			Sleep(1000)
		end
	end
end


for key,value in ipairs(Players2) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 ѭ���һ� �̾�ʯ��1���� 5��")
		for i = 1, 5 do
			QuestFrameOptionClicked("�һ��̾�ʯ��1����")
			Sleep(1000)
		end
	end
end


for key,value in ipairs(Players3) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 ѭ���һ� ����ʯ��1���� 5��")
		for i = 1, 5 do
			QuestFrameOptionClicked("�һ�����ʯ��1����")
			Sleep(1000)
		end
	end
end

for key,value in ipairs(Players4) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 ѭ���һ� �쾧ʯ��1���� 5��")
		for i = 1, 5 do
			QuestFrameOptionClicked("�һ��쾧ʯ��1����")
			Sleep(1000)
		end
	end
end
