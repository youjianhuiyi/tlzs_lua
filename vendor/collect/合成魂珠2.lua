PushDebugMessage("ǰ��������ͩ���ϳɻ���顭��")
--[[   ˵��
1�� -- 1������飨1����
2�� -- 5������飨1����
3�� -- 25������飨1����
4�� -- 125������飨1����
5�� -- 625������飨1����-----125��2��  -----25��3��-----5��4�� -----1��5��  ����1�������ϳ�5���Ļ����1����Ҫ�ϳɴ���156��
һ����꼼����1������6����Ҫ781������飨1������3������Ҫ2343������飨1����
]]

--����x, y, z, k�������ϳɵĻ���鼶��������
local N2 = 3      --2�����������
local N3 = 0      --3�����������  
local N4 = 0      --4����������� 
local N5 = 0      --5�����������  
local T = 5*N2+ 25*N3 + 125 *N4 + 625 * N5  -- һ����ҪT��1�������

local Item = {
    [1] = "����飨1����",
    [2] = "����飨2����",
    [3] = "����飨3����",
    [4] = "����飨4����",
    [5] = "����飨5����"
}
local Button = {
    [1] = "�ϳɻ���飨1����",
    [2] = "�ϳɻ���飨2����",
    [3] = "�ϳɻ���飨3����",
    [4] = "�ϳɻ���飨4����",
    [5] = "�ϳɻ���飨5����"
	}

--ǰ���ֿ�ȡ��1-5�������
PushDebugMessage("ǰ���ֿ�ȡ��1-5�������")
Bank_GetItem(" Item[1] Item[2] Item[3] Item[4] Item[5] ", -1); Sleep(1000)

--���㱳����1-5�����������
local N_1 = Bag:GetItemCount(Item[1], 0, 1); Sleep(500)  --������1�����������
local N_2 = Bag:GetItemCount(Item[2], 0, 1); Sleep(500)  --������2�����������
local N_3 = Bag:GetItemCount(Item[3], 0, 1); Sleep(500)  --������3�����������
local N_4 = Bag:GetItemCount(Item[4], 0, 1); Sleep(500)  --������4�����������
local N_5 = Bag:GetItemCount(Item[5], 0, 1); Sleep(500)  --������5�����������

--��ϳ���Ҫ��1�������������Ƚ�
local T_sj = N_1 + 5*N_2+ 25*N_3 + 125 *N_4 + 625 * N_5   --������ʵ��һ����T_sj��1�������
if T_sj - T >= 0 then
  PushDebugMessage("��Ļ�����㹻��������ɺϳ�����")
else
 PushDebugMessage("��Ļ���鲻�㣬����Ҫ" .. T - T_sj .. "��1�������")
end

--����ÿ���Ļ������Ҫ�ϳɶ��ٸ�
local needN_2 = string.format("%d", T/5)
local needN_3 = string.format("%d", T/25)
local needN_4 = string.format("%d", T/125)
local needN_5 = string.format("%d", T/625)

--ʵ����Ҫ�ϳ�ÿ���Ļ������Ҫ�ϳɶ��ٸ�
local needN2 = needN_2 - N_2
local needN3 = needN_3 - N_3
local needN4 = needN_4 - N_4
local needN5 = needN_5 - N_5

--�ϳ�ʱ��Ҫ��Money��2�� 50Y��3�� 50Y��4�� 1G��5�� 1G
local Money = needN2 *5000 + needN3 * 5000 + needN4 * 10000 + needN5 * 10000
local jiaozi = GetMoney(2) --�����еĽ���
local jinbi = GetMoney(1) --�����еĽ��
local needMoney = 10000 + Money - jiaozi - jinbi 

local jiaozi_jin = string.format("%d", jiaozi/10000)
local jiaozi_yin = string.format("%.2f",jiaozi/10000 - string.format("%d", jiaozi/10000)) * 100
local jiaozi_tong = string.format("%.4f",jiaozi/10000 - string.format("%.2f",jiaozi/10000)) * 10000
------------------------------------------------------------------------------------------------------
local jinbi_jin = string.format("%d", jinbi/10000)
local jinbi_yin = string.format("%.2f",jinbi/10000 - string.format("%d", jinbi/10000)) * 100
local jinbi_tong = string.format("%.4f",jinbi/10000 - string.format("%.2f",jinbi/10000)) * 10000
--------------------------------------------------------------------------------------------------------
PushDebugMessage("�㱳�����н��ӣ�" .. jiaozi_jin .. "��" .. jiaozi_yin .. "��" .. jiaozi_tong .. "ͭ")
PushDebugMessage("�㱳�����н�ң�" .. jinbi_jin .. "��" .. jinbi_yin .. "��" .. jinbi_tong .. "ͭ")

if jiaozi + jinbi >= needMoney then
	PushDebugMessage("�����ƶ���NPC��ͩ��,�ƶ��С���")
else
    Bank_GetMoney(needMoney, "����")
	local jin_bi = string.format("%d", needMoney/10000)
	PushDebugMessage("��ȡ����ң�" .. jin_bi .. "��")
	PushDebugMessage("�����ƶ���NPC��ͩ��,�ƶ��С���")	
end

MoveTo(139, 197, 2);Sleep(1000)

--�ϳɻ���飨2����
function HC(Button, Item, needn)
TalkNpc("��ͩ");Sleep(1000)
QuestFrameOptionClicked("�����ϳ�", 1);Sleep(1500)
QuestFrameOptionClicked(Button, 1);Sleep(1500)
PushDebugMessage(Item .. "�ϳ��С���")
    for i = 1, needn do 
	    QuestFrameOptionClicked("��Ҫ�ϳ�");Sleep(4000) 
		PushDebugMessage("��ɹ��ϳ���һ��" .. Item .."!")
    end
	PushDebugMessage("��ɹ��ϳ���" .. needn .. "��" .. Item .. "!")
end

if T_sj - T >= 0 then
if needN2 > 0 then
  HC(Button[2], Item[2], needN2)
end
if needN3 > 0 then
  HC(Button[3], Item[3], needN3)
end
if needN4 > 0  then
  HC(Button[4], Item[4], needN4)
end
if needN5 > 0 then
  HC(Button[5], Item[5], needN5)
end
local n1 = Bag:GetItemCount(Item[1], 0, 1); Sleep(500)  --�ϳ���󱳰���1�����������
local n2 = Bag:GetItemCount(Item[2], 0, 1); Sleep(500)  --�ϳ���󱳰���2�����������
local n3 = Bag:GetItemCount(Item[3], 0, 1); Sleep(500)  --�ϳ���󱳰���3�����������
local n4 = Bag:GetItemCount(Item[4], 0, 1); Sleep(500)  --�ϳ���󱳰���4�����������
local n5 = Bag:GetItemCount(Item[5], 0, 1); Sleep(500)  --�ϳ���󱳰���5�����������

   PushDebugMessage("��ɹ��ϳ���" .. n2 .. "������飨2��)," .. n3 .. "������飨3��)," .. n4 .. "������飨4��)," .. n5 .. "������飨5��)��")
   Sleep(1000)
   PushDebugMessage("��Ļ����ϳ���������ɣ�")
else
   PushDebugMessage("��Ļ����ϳ������޷���ɣ�")
end