PushDebugMessage("�����Զ�12���������ű��Լ�ִ�У��Զ�����")


local slaveTeam = {
	"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f",
	"�����S�O����","��m������","������","TH��Ī��","��n��������","СС��ͯ2",
	"Se��ʅ�Z��Y","����Ӱ����"," �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"
};

local masterTeam = {
	"��Ҽ�~�u�ͤ�","�n�ƶ����f","����֮��","���հ��~��","��FЦ��D��","�����Ļز�",
	"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����",
	"СҶؼ��ɱ","�޸��_����","����С��","�耣��g","�n�ϣ������f","��Lynthia"
};

function createGroup()
	playName = GetPlayerInfo("NAME");
	for key,value in ipairs(slaveTeam) do
		PushDebugMessage("��ǰ��ɫ����" .. playName);
		if playName == value then
			PushDebugMessage(value .. "׼��ȥ��12��������׼���Զ�ˢ����");
			if key >= 1 and key <= 6 then
				judgeTeamPlayers(1,6)
			elseif key >= 7 and key <= 12 then
				judgeTeamPlayers(7,12)
			elseif key >= 13 and key <= 18 then
				judgeTeamPlayers(13,18)
			else
				return false
			end
			--ִ�нű�("12�˸���")
		end
	end
end


function judgeTeamPlayers(key1,key2)
	local masterNum = 0;
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
	-- �ж�������Ҫ���ŵĶ��鵽��֮�����˳���ǰ�Ŷ�
	if masterNum >= 6 then
		--�˳�����
		Team:LeaveTeam()
	else
		judgeTeamPlayers(key1, key2)
	end
end

--���ĵ��ã�
MoveToNPC(210,173,246,"����");Sleep(1000)
for i = 0 ,10 do
	createGroup();
	Sleep(10000);
end
