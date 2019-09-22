--背包相关功能

--遍历道具栏材料栏所有物品
--返回值：物品数组
local tObj = Bag:EnumAllObj()
for i = 1, #tObj do
    local tmp = tObj[i]
    local strMsg =
        string.format(
        " 位置：%d\r\n id:%d\r\n 名称：%s\r\n 文本类型：%s\r\n 整数类型：%d\r\n 等级：%d\r\n 数量：%d\r\n 绑定：%d\r\n 锁定:%d\r\n 制作者：%s",
        tmp.index,
        tmp.id,
        tmp.name,
        tmp.class,
        tmp.menpai,
        tmp.level,
        tmp.count,
        tmp.bind,
        tmp.lock,
        tmp.author
    )
    MessageBox(strMsg)
end

--遍历不绑定的物品
--	返回值：物品数组 (类似 Bag:EnumAllObj() 的返回值)
--  参数1：逻辑型		是否过滤锁定的物品
--  参数2：物品数组		需要遍历的物品数组(可不填，不填则内部调用 tObj = Bag:EnumAllObj())
local tUnBind = Bag:EnumUnBindItem(false, tObj)

--遍历绑定的物品
--	返回值：物品数组 (类似 Bag:EnumAllObj() 的返回值)
--  参数1：逻辑型		是否过滤锁定的物品
--  参数2：物品数组		需要遍历的物品数组(可不填，不填则内部调用 tObj = Bag:EnumAllObj())
local tBind = Bag:EunmBindItem(true, tObj)

--查找道具栏+材料栏物品
--	返回值：物品数组 (类似 Bag:EnumAllObj() 的返回值)
--  参数1：文本型		物品全名称，支持多个物品，空格隔开
local tObj = Bag:SearchItem("珍兽滋补丹 珍兽回春丹 珍兽万补丹")

--查找道具栏物品
--	返回值：2个(逻辑型 整数型) 是否找到 位置索引
--  参数1：文本型 		物品名称，只支持精确名字
--  参数2：整数型 		绑定状态 0无所谓 1不绑的 2绑定的
local bFind, nIndex = Bag:FindBagItem_DJ("珍兽回春丹", 0)

--查找道具栏物品
--	返回值：整数型		返回的找到位置索引，从0开始。没找到返回-1
--  参数1：文本型		物品名称，只支持精确名字
local nfindIdx = Bag:FindBagItem_1("珍兽回春丹")

--查找任务栏物品
--	返回值：整数型		返回的找到位置索引，没找到返回-1
--  参数1：文本型		物品名称，只支持精确名字
local nfindIdx = Bag:FindBagItem_3("伤药")

--查找道具+材料+任务,会叠加统计所有找到的数量 (3个返回值)
--	返回值：3个(逻辑型 整数型 整数型) 是否找到 所有数量 位置索引
--  参数1：文本型		物品名称，只支持精确名字
local bFind, nCount, nIndex = Bag:FindBagItem_All("掌柜要诀")

--模糊查找道具栏+材料栏
--	返回值：物品数组
--  参数1：文本型		物品名称的一部分
local tMohu = Bag:FindItem_vague("坐骑：")

--获取背包物品数量
--	返回值：整数型
--  参数1：文本型		物品名称，只支持精确名字
--  参数2：整数型		绑定状态 0无所谓 1不绑的 2绑定的
--  参数3：整数型		锁定状态 0无所谓 1不锁的 2锁定的
local nCount = Bag:GetItemCount("古兰玉", 0, 1)

--点击使用背包物品道具栏 材料栏
--  参数1：整数型		物品位置索引0-59
Bag:ItemBtnClicked(6)

--使用道具栏物品
--	返回值：2个(逻辑型 整数型) 是否使用 位置索引
--  参数1：文本型		物品名称，支持多个物品，空格隔开
--  参数2：整数型		0无所谓 1不绑的 2绑定的
local bUse, nIndex = Bag:UseBagItem_DJ("真元珀 真元精珀 释灵浆", 0)

--使用道具栏物品(另一种实现方式，会打开背包)
--	返回值：整数型		返回的找到位置索引，没找到返回-1
--  参数1：文本型		物品名称，只支持精确名字
local nfindIdx = Bag:UseItem_2("悲酥清风解药")

--使用任务栏物品
--  参数1：文本型		物品名称，只支持精确名字
Bag:UseItem_3("灵鹫圣使的衣帽")

