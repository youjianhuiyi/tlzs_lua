--[[

本文件可以复制在  C:\TLZZ\角色设置\私有设置\你的角色名\坐标摆摊.lua 进行修改 , 以后更新不会被覆盖

]]--

--若担心摆摊被别人占了位置，可按下面的格式继续修改或增加N个坐标(这里示例中提供了3个坐标),脚本会依次尝试每个坐标，直到摆摊成功
--脚本界面上设置的坐标已经被占才会使用这里的坐标
PushDebugMessage("摆摊坐标可自定义,具体查看script/数据 目录")

local 摆摊坐标 = {}

摆摊坐标["洛阳"] = {{x=317,y=270},{x=322,y=270},{x=336,y=270}}

摆摊坐标["苏州"] = {{x=224,y=253},{x=224,y=244},{x=224,y=241}}

摆摊坐标["楼兰"] = {{x=230,y=139},{x=225,y=139},{x=220,y=139}}

摆摊坐标["钱庄"] = {{x=60,y=55},{x=60,y=49},{x=60,y=43}}




--若想在摆摊前先去仓库取一次物品这里把0改1
local 运行摆摊时先取一次物品 = 0




--以下请不要修改！！！
g_BtPos = {}
g_BtPos = 摆摊坐标
g_BtStartGetItem = 运行摆摊时先取一次物品
