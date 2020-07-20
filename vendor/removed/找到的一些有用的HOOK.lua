setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();--关闭元宝商城
setmetatable(_G, {__index = YuanbaoShop_Env});YuanBao_OnHiden();
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("OPEN_LIJINSHOP");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("UPDATE_BOOTH");
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);--打开红利商店
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();---下一页
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);--买红晶石

setmetatable(_G, {__index = Packet_Env});this:Hide();--关闭背包
setmetatable(_G, {__index = Packet_Env});Packet_CloseFunction();--关闭背包
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnEvent("PACKET_OPENED");--打开背包

setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();--打开元宝店
setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_OnEvent("TOGGLE_YUANBAOSHOP");--打开元宝店

setmetatable(_G, {__index = Packet_Env});Packet_PackUp_Clicked();--整理背包栏

setmetatable(_G, {__index = Packet_Env});Packet_ChangeTabIndex(1);--打开材料栏

setmetatable(_G, {__index = Packet_Env});OpenSafeCenter(); ---打开安全中心
setmetatable(_G, {__index = SafeCenter_SafeScore_Env});SafeCenter_SafeScore_OpenSafeCheck();---打开安全验证
setmetatable(_G, {__index = SafeCenter_SafeCheck_Env});SafeCenter_SafeCheck_FastCheck_Click();--点击 畅游+app验证
setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_SelfEquip_Clicked();---打开角色主界面