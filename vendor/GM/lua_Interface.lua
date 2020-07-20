--您还可以参考自定义 新手任务阉割版 文件

--右击可以刷新或后退到更新说明页面

--获取任务类表所有已接任务名称
local strTemp = GetPlayerMissionAllName()
MessageBox(strTemp)

--【商会存物】

--参数一：商会ID(支持多个商会,空格分开，优先存放在靠前的)
--参数二：放入开张柜台物品。物品之间以空格分开，如需拆分后放入商会,物品名后面加|拆分数量。支持部分类型统称：所有宝石 子女装备  珍兽装备 (珍兽装备只限75级1星的)
--参数三：放入打烊柜台物品。同上
--参数四:是否从仓库取出物品存放在商会。填true则仓库取出，填false不取.
--示例
LoadScript("fn商会.lua") --需要先加载这个模块
SHCW_OnStart("101 202", " 物品1|1  珍兽装备 物品3|2 ", "", true) --【商会存物】示例1： 从仓库取，只放入开张柜台
SHCW_OnStart("232", "", " 打烊物品一 打烊物品二 ", false) --【商会存物】示例2： 不从仓库取，只放入打烊柜台
SHCW_OnStart("135 256 358", " 开张一 开张二 ", " 打烊一 打烊二 ", true) --【商会存物】示例3： 从仓库取，放入开张和打烊柜台

--【商会取物】

--参数一：商会ID(支持多个商会,空格分开，优先存放在靠前的)
--参数二：物品之间用空格隔开。格式：物品名称1|数量|允许下架 物品名称2|数量|允许下架
--示例
LoadScript("fn商会.lua") --需要先加载这个模块
SHQW_OnStart("232", "玉龙髓|5|1 黄纸|40|0 藏宝图|0|0") --取5个玉龙髓(可取上架中的) 取40个黄纸(取未上架的) 取出所有藏宝图(未上架)

--【商会取钱】
PS_GetMoney(15 * 10000) --取出15金。单位铜

--【获取任务】
--战盟守备5个子类任务,用任务ID判断
local tMission = {{id = 1369}, {id = 1370}, {id = 1371}, {id = 1372}, {id = 1373}}
for i = 1, #tMission do
    local nIndex, idScript = GetPlayerMission_ID(tMission[i].id)
    if nIndex ~= -1 then
        PushDebugMessage("战盟守备：当前已接任务ID" .. tMission[i].id)
        break
    end
end

--四绝庄恩怨
local nIndex, idMission, idScript = GetPlayerMission_Item("#{SJZ_100129_03}")

--杀星
local nIndex, idMission, idScript = GetPlayerMission_Item("#{SXRW_090119_002}")

--这个是老三
local nIndex, idMission, idScript = GetPlayerMission_Item("除匪首力破三关")

--剑荡三环除妖魔
local nIndex, idMission, idScript = GetPlayerMission_Item("#{XSHYH_150211_2}")

if nIndex ~= -1 then --nIndex：序号为-1表示没有接此任务,不为-1则已接该任务
    QuestFrameMissionAbnegate(idScript) --【放弃任务】
end

--【NPC对话框点击完成,并领取奖励,参数是物品ID，可以不填】
QuestFrameMissionComplete(idItem)
