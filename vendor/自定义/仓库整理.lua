local g_szItemName = AI_GetParameter("仓库取物")
local nCnt = Bank_GetItem(" 彩棉 龙纹玉灵 麟木箭 炼玉10级 丹青 龙血矿石 彩虹之箭 打造图 缝纫类材 九宫盒 丝线3级 染料3级 高级布片 棉布碎片 琉璃焰 御瑶盘 稀世珍宝图 秘银碎片 精铁碎片 玄天寒玉 低级宝石合成符 宝石雕琢符3级 灵鹫石 五毒珠·元阳 五毒珠·魂武 五毒珠·星眸 绿晶石(1级) 蓝晶石(1级) 黄晶石(1级) 红晶石(1级) 猫眼石(1级) 虎眼石(1级) 石榴石(1级) 月光石(1级) 尖晶石(1级) 祖母绿(1级) 高级药材 珍兽蛋 中级药材 变石(1级) 黄玉(1级) 碧玺(1级) 紫玉(1级) 皓石(1级) 黄宝石(1级) 蓝宝石(1级) 绿宝石(1级) 黑宝石(1级) 红宝石(1级) 缀龙石·元 缀龙石·伤 缀龙石·暴 技能书 玉龙髓 净云水 铸纹血玉 玉华灵泉 五毒珠·魂武 五毒珠·星眸 五毒珠·元阳 释灵浆 督脉运功典藏 坐骑 ", 31,1)
--支持输入负数 例：local nNeedMoney = -5*10000,表示仓库只保留5金，其他全部取出来,可用于将多余金币交易给老板
-- 默认取5J 自己可修改
--local nNeedMoney = -20*10000
--下面的看不懂不要改
--PushDebugMessage("#eDC4C18#cFFFF00前往银行自动取钱")
--Bank_GetMoney(nNeedMoney)
--MoveToNPC(330,299,LUOYANG_ID,"乔复盛");Sleep(3000)
--执行脚本("交易给老板号")
--local PlayerName = GetPlayerInfo("NAME")
--if  (PlayerName=="ぁ壹葉醬油あ ") then
--	QuestFrameOptionClicked("管理自己的商店",1);Sleep(1000)	
--	执行脚本("老板接收交易")
--else
--	QuestFrameOptionClicked("管理合作的商店",1);Sleep(1000)
--	执行脚本("交易给老板号")
--end