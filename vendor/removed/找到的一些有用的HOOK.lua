setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();--�ر�Ԫ���̳�
setmetatable(_G, {__index = YuanbaoShop_Env});YuanBao_OnHiden();
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("OPEN_LIJINSHOP");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("UPDATE_BOOTH");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);--�򿪺����̵�
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();---��һҳ
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);--��쾧ʯ

setmetatable(_G, {__index = Packet_Env});this:Hide();--�رձ���
setmetatable(_G, {__index = Packet_Env});Packet_CloseFunction();--�رձ���
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnEvent("PACKET_OPENED");--�򿪱���

setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();--��Ԫ����
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("TOGGLE_YUANBAOSHOP");--��Ԫ����

setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();--��������

setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);--�򿪲�����

setmetatable(_G, {__index = Packet_Env});OpenSafeCenter(); ---�򿪰�ȫ����
setmetatable(_G, {__index = SafeCenter_SafeScore_Env});SafeCenter_SafeScore_OpenSafeCheck();---�򿪰�ȫ��֤
setmetatable(_G, {__index = SafeCenter_SafeCheck_Env});SafeCenter_SafeCheck_FastCheck_Click();--��� ����+app��֤
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_SelfEquip_Clicked();---�򿪽�ɫ������