
function _使用领取物品()
_消耗物品("武约好礼");
_消耗物品("一袋碎银");
_消耗物品("真元珀");
_消耗物品("真元精珀");

_消耗物品("紫色真元符集");
_消耗物品("真元·紫气符");
_消耗物品("真元·紫定符");
_消耗物品("真元·紫力符");
_消耗物品("真元·紫体符");
_消耗物品("真元·紫灵符");
_消耗物品("真元·紫坚符");
_消耗物品("真元·紫韧符");
_消耗物品("真元·紫劲符");
_消耗物品("真元·紫闪符");
_消耗物品("真元·紫暴符");
_消耗物品("真元·紫准符");
_消耗物品("真元·紫罡符");
end 

function _消耗物品(WuPing)
local _, nCount, _ = FindBagItem(-1, WuPing)
      if nCount >=1  then
      PushDebugMessage("消耗物品中")
             if WuPing == "武约好礼"  then
             UseItem(0,"武约好礼")
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

function _领取修武之约_普通奖励()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(1,0)")
Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(2,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(3,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(4,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(5,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(6,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(7,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(8,0)")
    Sleep(1000)
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(9,0)")
    Sleep(1000)
_使用领取物品()
GetLuaValue("setmetatable(_G, {__index = Fuli_ZhanLing_Env});Fuli_ZhanLing_GetPrize(10,0)")
    Sleep(1000)
_使用领取物品()
end

_领取修武之约_普通奖励()