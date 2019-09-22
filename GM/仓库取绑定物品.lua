--在界面[信息]-[自定义参数]页面，可设置参数名和物品名称
--格式：取仓库绑定物品|子女装备 五行法帖
local strItem = AI_GetParameter_User("取仓库绑定物品") 

--前后加空格
strItem = " " .. strItem .. " " 

PushDebugMessage("取出物品：" .. strItem)

--参数1：需取出的物品名称 ，空格分开
--参数2：取出的数量
--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
--参数4：整理背包 true 或 false 可空
--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
Bank_GetItem(strItem, -1, 2)

