PushDebugMessage("ǰ������ ɨ����ɮ ��������")

--�жϱ����еĹ���������
local _, A, _ = FindBagItem(-1, "������")
PushDebugMessage("��ǰ�����еĹ���������" .. A)


--ǰ������ȡ����������ң�Ĭ�ϲֿ���5��
local nNeedMoney = -5 * 10000
PushDebugMessage("ǰ������ȡǮ���ֿ���5��")
Bank_GetMoney(nNeedMoney);Sleep(1500)

--�ֿ�ȡ������
local g_szItemName = " ������ "
Bank_GetItem(g_szItemName, -1);Sleep(1500)

--�жϲֿ�ȡ���������󱳰��﹦��������
local _, nCount, _ = FindBagItem(-1, "������")
PushDebugMessage("��Ӳֿ�ɹ�ȡ��" .. nCount-A .. "����������")

--�жϹ���������>=3��ʱ��������
if nCount >= 3 then
   PushDebugMessage("���ڿ�ʼ����")
   LoadScript("������") 
 --ʹ�� ������ �������,ѭ��ִ��3��
   for i = 1, 3 do
       UseItem(0,"������");Sleep(1000)
   --����ȷ�� ��ͼѰ·ȷ����������Ʒȷ����...
       MessageBox_Self_OK_Clicked();Sleep(1000)
       PushDebugMessage("ʹ��1����������")
       LoadScript("������") 
   end
   PushDebugMessage("�������4��������")
--�ж�1�ܹ�����������3ʱ��������
elseif  nCount < 3 and nCount > 0 then
   PushDebugMessage("���ڿ�ʼ����")
   LoadScript("������") 
 --ʹ�� ������ ���������ѭ��ִ�� nCount ��
   for i = 1, nCount do
       UseItem(0,"������");Sleep(1000)
       --����ȷ�� ��ͼѰ·ȷ����������Ʒȷ����...
       MessageBox_Self_OK_Clicked();Sleep(1000)
       PushDebugMessage("ʹ��1����������")
       LoadScript("������") 
   end
   PushDebugMessage("�������" .. nCount+1 .."��������")

else
   PushDebugMessage("���ڿ�ʼ����")
   LoadScript("������") 
   PushDebugMessage("�������1��������")
end


--����Ʒ�ͽ��
PushDebugMessage("��������Ĺ���������Ҵ����ֿ�...")

local g_szItemName, g_bNoSaveMoney = "������"
-- �жϱ����Ƿ�����Ҫ��ֵ���Ʒ
if not FindBagItem(-2, g_szItemName) then
    PushDebugMessage("��ǰ������û��Ҫ��ֵĹ�������")
  -- ��������޸İ������¶���ͭ
    local nTong = 0
    Bank_SaveMoney(nTong)   
else
   -- ��֣�����1ǰ�󶼼�һ���ո� ��Ʒ�����Կո�ֿ�
   -- ����2�Ƿ��Ǯ true �� false
   local _, nCount, _ = FindBagItem(-1, "������")         
   Bank_SaveItem(g_szItemName, g_bNoSaveMoney)
   PushDebugMessage("��ɹ�����ֿ�" .. nCount .. "����������") 
end
