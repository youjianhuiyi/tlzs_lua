PushDebugMessage("�����Զ�12���������ű��Լ�ִ�У��Զ�����")

local players = {
	"Se��ʅ�Z��Y","����Ӱ����"," �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������",
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"
};


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