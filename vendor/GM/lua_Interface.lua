--�������Բο��Զ��� ���������˸�� �ļ�

--�һ�����ˢ�»���˵�����˵��ҳ��

--��ȡ������������ѽ���������
local strTemp = GetPlayerMissionAllName()
MessageBox(strTemp)

--���̻���

--����һ���̻�ID(֧�ֶ���̻�,�ո�ֿ������ȴ���ڿ�ǰ��)
--�����������뿪�Ź�̨��Ʒ����Ʒ֮���Կո�ֿ��������ֺ�����̻�,��Ʒ�������|���������֧�ֲ�������ͳ�ƣ����б�ʯ ��Ůװ��  ����װ�� (����װ��ֻ��75��1�ǵ�)
--��������������ȹ�̨��Ʒ��ͬ��
--������:�Ƿ�Ӳֿ�ȡ����Ʒ������̻ᡣ��true��ֿ�ȡ������false��ȡ.
--ʾ��
LoadScript("fn�̻�.lua") --��Ҫ�ȼ������ģ��
SHCW_OnStart("101 202", " ��Ʒ1|1  ����װ�� ��Ʒ3|2 ", "", true) --���̻���ʾ��1�� �Ӳֿ�ȡ��ֻ���뿪�Ź�̨
SHCW_OnStart("232", "", " ������Ʒһ ������Ʒ�� ", false) --���̻���ʾ��2�� ���Ӳֿ�ȡ��ֻ������ȹ�̨
SHCW_OnStart("135 256 358", " ����һ ���Ŷ� ", " ����һ ���ȶ� ", true) --���̻���ʾ��3�� �Ӳֿ�ȡ�����뿪�źʹ��ȹ�̨

--���̻�ȡ�

--����һ���̻�ID(֧�ֶ���̻�,�ո�ֿ������ȴ���ڿ�ǰ��)
--����������Ʒ֮���ÿո��������ʽ����Ʒ����1|����|�����¼� ��Ʒ����2|����|�����¼�
--ʾ��
LoadScript("fn�̻�.lua") --��Ҫ�ȼ������ģ��
SHQW_OnStart("232", "������|5|1 ��ֽ|40|0 �ر�ͼ|0|0") --ȡ5��������(��ȡ�ϼ��е�) ȡ40����ֽ(ȡδ�ϼܵ�) ȡ�����вر�ͼ(δ�ϼ�)

--���̻�ȡǮ��
PS_GetMoney(15 * 10000) --ȡ��15�𡣵�λͭ

--����ȡ����
--ս���ر�5����������,������ID�ж�
local tMission = {{id = 1369}, {id = 1370}, {id = 1371}, {id = 1372}, {id = 1373}}
for i = 1, #tMission do
    local nIndex, idScript = GetPlayerMission_ID(tMission[i].id)
    if nIndex ~= -1 then
        PushDebugMessage("ս���ر�����ǰ�ѽ�����ID" .. tMission[i].id)
        break
    end
end

--�ľ�ׯ��Թ
local nIndex, idMission, idScript = GetPlayerMission_Item("#{SJZ_100129_03}")

--ɱ��
local nIndex, idMission, idScript = GetPlayerMission_Item("#{SXRW_090119_002}")

--���������
local nIndex, idMission, idScript = GetPlayerMission_Item("��������������")

--������������ħ
local nIndex, idMission, idScript = GetPlayerMission_Item("#{XSHYH_150211_2}")

if nIndex ~= -1 then --nIndex�����Ϊ-1��ʾû�нӴ�����,��Ϊ-1���ѽӸ�����
    QuestFrameMissionAbnegate(idScript) --����������
end

--��NPC�Ի��������,����ȡ����,��������ƷID�����Բ��
QuestFrameMissionComplete(idItem)
