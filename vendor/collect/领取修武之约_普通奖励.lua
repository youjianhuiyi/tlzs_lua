
function _ʹ����ȡ��Ʒ()
_������Ʒ("��Լ����");
_������Ʒ("һ������");
_������Ʒ("��Ԫ��");
_������Ʒ("��Ԫ����");

_������Ʒ("��ɫ��Ԫ����");
_������Ʒ("��Ԫ��������");
_������Ʒ("��Ԫ���϶���");
_������Ʒ("��Ԫ��������");
_������Ʒ("��Ԫ�������");
_������Ʒ("��Ԫ�������");
_������Ʒ("��Ԫ���ϼ��");
_������Ʒ("��Ԫ�����ͷ�");
_������Ʒ("��Ԫ���Ͼ���");
_������Ʒ("��Ԫ��������");
_������Ʒ("��Ԫ���ϱ���");
_������Ʒ("��Ԫ����׼��");
_������Ʒ("��Ԫ�����");
end 

function _������Ʒ(WuPing)
local _, nCount, _ = FindBagItem(-1, WuPing)
      if nCount >=1  then
      PushDebugMessage("������Ʒ��")
             if WuPing == "��Լ����"  then
             UseItem(0,"��Լ����")
             GetLuaValue("setmetatable(_G, {__index = HuoyueWeeklyGift_Env});HuoyueWeeklyGift_Select(1)");Sleep(1000)
             GetLuaValue("setmetatable(_G, {__index = LoginSelectServerQuest_Env});SelectServerQuest_Bn1Click();")
                else
                    for i = 1,5 do
                       UseItem(0,WuPing);
                       Sleep(100)
                     end
             end
       end 
end

function _��ȡ����֮Լ_��ͨ����()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(1,0)")
Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(2,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(3,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(4,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(5,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(6,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(7,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(8,0)")
    Sleep(1000)
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(9,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(10,0)")
    Sleep(1000)
_ʹ����ȡ��Ʒ()
end

_��ȡ����֮Լ_��ͨ����()