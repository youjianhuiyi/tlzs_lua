local strSceneName = GetActiveSceneName() --当前地图名

local nSceneID = GetSceneID() --当前地图ID

local nHpp = GetHPPercent() --当前血百分比

local nMpp = GetMPPercent() --当前蓝百分比

local strSceneName = GetSceneNameByID(1) --用地图id取地图名

local nLeader = IsLeader() --是否队长 是返回1，不是返回0

local nFollow = IsFollow() --是否跟随  是1 不是0

--获取状态索引，没有返回-1
local nIndex = Player_GetBuff("坐骑：")

local bQx = Player_DispelBuffByName("坐骑：") --取消某个状态，模糊状态名称

local nState = Player_GetMountID() --坐骑id 没上坐骑返回-1

Player_TeamFollow(false) --取消组队跟随
Player_TeamFollow(true) --组队跟随


--清理背包 -1:全清理，0:清理道具栏 1:清理材料栏 2:清理绑定物品
DelBagItem(0)

--捡包
PickUpLua()

--上坐骑
UseMount()
--下坐骑
Dismount()
--对话npc
TalkNpc("NPC名字")

--遍历周围所有对象数组,有以下属性
--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
--id,名称，类型，称号，x坐标，y坐标，距离，血，GUID,怪物拥有者id，门派，珍兽拥有者id,状态，作物类型，等级，目标id,模型id，帮会id,是否在队伍，是否队长
local tObj = Enum2XAllObj()

--过滤类型。 参数2：依次代表 {NPC,怪物，玩家，珍兽，宝箱} 0排除，1保留，
tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})

--过滤类型 通过文本类型(class字段值)
tObj = ObjFilterByszClass(tObj, "玩家 珍兽")

--过滤帮会id,返回帮会id为23和56的对象
tObj = ObjFilterByBHID(tObj, " 23 56 ")

--过滤 红绿白怪，组合"红绿白"
tObj = ObjFilterByColor(tObj, "红绿")

--过滤距离 ,返回小于等于15距离范围的
tObj = ObjFilterByDst(tObj, 15)

--过滤血值百分比，参数2：百分比，参数3：1返回大于百分比的，2返回小于等于百分比的
tObj = ObjFilterByHP(tObj, 80, 1)

--过滤等级，参数2：等级，参数3：，1返回小于等于等级的，2返回大于等级的
tObj = ObjFilterByLevel(tObj, 89, 1)

--过滤名字，name字段 参数3：0-5种查找模式
--0：需完全和参数2一样 name为"名称"符合
--1：在参数2种拥有即可，name="名" 或 name="称"  或 name="名称" 则保留
--2：同1，但是取反.在参数2种拥有则排除，name="名" 或 name="称"  或 name="名称" 则不保留返回
--3：多个名称查找，参数2前后必须空格 例如 参数2= " 名称1 名称2 名称3 "，
--4：同3，但是取反
--5：从name种查找参数2字串。(1-4都是从参数2查找name字串)
tObj = ObjFilterByName(tObj, "名称", 0)

--过滤id 排除参数2的id
tObj = ObjFilterByTID(tObj, {id = 1, id = 123})

--过滤称号，参数3 0-3
--0：同 ObjFilterByName  0
--1：同 ObjFilterByName  1
--2：同 ObjFilterByName  5
--3：同 ObjFilterByName  3
tObj = ObjFilterByTitle(tObj, "对萧远山造成伤害", 0)

--按距离排序，从小到大。无返回值，直接改变tObj
BubbleByDst(tObj, 1)
--按血排序，从小到大。无返回值，直接改变tObj
BubbleByHP(tObj, 1)
--按等级排序，从大到小。无返回值，直接改变tObj
BubbleByLevel(tObj, 2)

--以下是对常用的一些封装
--遍历指定类型目录
--参数2 {血百分比，距离} 血0过滤掉死亡的，距离0就是不判断距离
--参数3 排序。 0不排序 1按距离升序，2按距离降序 3按血值升序，4按血降序
local tAll = Enum2XByClass("NPC 怪物", {0, 0}, 0)
--遍历血大于80，距离小于15的 玩家
local tAll = Enum2XByClass("玩家", {80, 15}, 0)

--遍特指定的名称的对象
--参数2：类型过滤 1.npc 2.怪物 3.玩家 4.珍兽 5.宝箱 {1,1,1,1,1},{1,1,0,0,0}
--参数3：过滤血 距离 {0,0}
--参数4：0.不排序 1.先近后远 2.先远后进，3先血少后血多，4先血多后血少
--参数5：匹配模式 参照ObjFilterByName参数3
local tObj = Enum2XByName("不起眼的土堆", {1, 1, 0, 0}, nil, nil, 0)

--参数2：类型过滤 1.npc 2.怪物 3.玩家 4.珍兽 5.宝箱 {1,1,1,1,1},{1,1,0,0,0}
--参数3：过滤血 距离 {0,0}
--参数4：0.不排序 1.先近后远 2.先远后进，3先血少后血多，4先血多后血少
--参数5：匹配模式 参照ObjFilterByTitle参数3
local tObj = Enum2XByTitle("战盟总管", {1, 0, 0, 0}, nil, 0, 0)

--遍历仓库所有物品，返回物品数组
--,obj ,name ,class ,id ,level,index ,menpai ,xing ,count ,bind ,lock
local tObj = Bank:EnumAllObj()

--仓库取钱，参数2可空
Bank_GetMoney(10000, "洛阳")

--仓库取物品,部分参数可空
--参数1：需取出的物品名称 ，空格分开
--参数2：取出的数量
--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的
--参数4：整理背包 true 或 false
--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的
Bank_GetItem(" 愿灵泉 鲜花的种子 花肥 ", -1)

--获取仓库总剩余空格数
local nSpace = Bank_GetSpaceNum()

--仓库存物品
-- 参数2：是否存钱
-- 参数3：需取出的绑定状态
Bank_SaveItem(" 碧玉腰环 碧玉戒指 碧玉护符 碧玉护腕 ", false, 1)

--仓库存钱
Bank_SaveMoney(5000)


