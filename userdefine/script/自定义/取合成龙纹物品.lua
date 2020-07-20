local g_szItemName = AI_GetParameter("仓库取物")
-- 第一个参数，表示要取的物品，用空格隔开
-- 第二个参数，取出模式
-- 第三个参数，0表示所有都取出，1表示取出不绑定物品，2表示取出绑定物品
local nCnt = Bank_GetItem(" 铸纹血玉  龙纹玉灵 ", 31,2)