PushDebugMessage("�����Զ�12���������ű��Լ�ִ�У��Զ�����")

local players1 = {
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"
};
local players2 = {
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2"
};
local players3 = {
	"Se��ʅ�Z��Y","����Ӱ����"," �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"
};
local TeamLeaders1 = {
	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"
};
local TeamLeaders2 = {
	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"
};
local TeamLeaders3 = {
	"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"
};
local playName = GetPlayerInfo("NAME")

function createGroup()
	playerName = GetPlayerInfo("NAME");
	for key,value in ipairs(players) do
		PushDebugMessage("��ǰ��ɫ����" .. playName);
		if playName == value then
			PushDebugMessage(value .. "׼��ȥ��12��������׼���Զ�ˢ����");
			ִ�нű�("12�˸���")
		end
	end
end
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
	tmp.name
        
    MessageBox(strMsg)
end



--�����Ա��������
local strTeam = Team:GetAllName()
MessageBox(strTeam)
--ȡ��Χ�Ķ����Ա,�����Լ�
--	����ֵ1��������		��Χ�����Ա����
--	����ֵ2����Ա����   
--	����1����Χ�ķ�Χ����
local nCount,tObj = Team:GetSurroundMember(15)
for k,v in ipairs(tObj) do
	PushDebugMessage(k .. v)
end
--�˳�����
Team:LeaveTeam()