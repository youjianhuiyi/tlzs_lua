--[[
    �ű����ܣ��Զ���ˢ 12 ���Զ����Ŷ�
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
PushDebugMessage("#eDC4C18#cFFFF00 �����Զ�12���������ű��Լ�ִ�У��Զ�����")
local masterNum = 0;

-- local slaveTeam = {
-- 	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f",
-- 	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
-- 	"Se��ʅ�Z��Y","����Ӱ����"," �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"
-- };

-- local masterTeam = {
-- 	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�",
-- 	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����",
-- 	"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"
-- };
------------------------------------------------------
-- �������
------------------------------------------------------
LoadScript("allPlayers.lua");

------------------------------------------------------
-- �����Ŷ�
------------------------------------------------------
function createGroup()
	playName = GetPlayerInfo("NAME");
	for key,value in ipairs(slaveTeam) do
		PushDebugMessage("#eDC4C18#cFFFF00 ��ǰ��ɫ����" .. playName);
		if playName == value then
			PushDebugMessage(value .. "#eDC4C18#cFFFF00 ׼��ȥ��12��������׼���Զ�ˢ����");
			key = math.ceil( key/6 )
			if key == 1 then
				loopExec(1,6)
			elseif key == 2  then
				loopExec(7,12)
			elseif key == 3 then
				loopExec(13,18)
			else
				return false
			end
			--ִ�нű�("12�˸���")
		end
	end
end

------------------------------------------------------
-- ����ִ��
------------------------------------------------------
function loopExec(key1,key2)
	while true do
		result = judgeTeamPlayers(key1,key2)
		if result then
			break
		end
	end
end


------------------------------------------------------
-- �ж���ߵĽ�ɫ
------------------------------------------------------
function judgeTeamPlayers(key1,key2)
	--��һ��
	--������Χ���ж�������,����������
	--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
	--id,���ƣ����ͣ��ƺţ�x���꣬y���꣬���룬Ѫ��GUID,����ӵ����id�����ɣ�����ӵ����id,״̬���������ͣ��ȼ���Ŀ��id,ģ��id�����id,�Ƿ��ڶ��飬�Ƿ�ӳ�
	local tObj = Enum2XAllObj()
	--�������͡� ����2�����δ��� {NPC,�����ң����ޣ�����} 0�ų���1������
	tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})
	--���˰��id,���ذ��idΪ84�Ķ���
	tObj = ObjFilterByBHID(tObj, " 84 ")
	for i = 1, #tObj do
		local tmp = tObj[i]
		--ȡ��ɫ���ơ��Ա������������,������ų������ڵĶӣ�����Ҫ����������������Ŷ����ڵĶӣ���Ҫ�˶ӡ�
		--����Ӧ��Ҫ������ŵĶ�������ת�����ַ������в��ң���Ա��û�е���
		local masterStr = table.concat( masterTeam, ", ", key1, key2 )
		if string.find( masterStr,tmp.name) ~= nil then
			masterNum = masterNum + 1
		end
	end

	if masterNum == 6 then
		Sleep(3000)
		--�˳�����
		Team:LeaveTeam()
		return true
	else
		return false
	end
end

------------------------------------------------------
-- �ж� NPC �ܱߵĶ�������
------------------------------------------------------
function checkNPCDst()
	local Obj = Enum2XAllObj()
	for i = 1, #Obj do
		local tmp = Obj[i]
		if tmp.name == "����" and tonumber(tmp.dst) <= 3 then
			return true
		else
			for j=1,3 do 
				MoveToNPC(210,173,246,"����");Sleep(1000)
			end
			return true
		end
	end
end

------------------------------------------------------
-- ���ĵ��ã�
------------------------------------------------------
checkNPCDst();
createGroup();
