-----开始----------------------
local MapName = GetActiveSceneName()
--判断角色当前所在地图，就近领取任务
local flag = true

function goGuild()
	if MapName == "洛阳" then
		MoveToNPC(237,236,0,"范纯仁");Sleep(1000)
		flag = false
	elseif MapName == "苏州" then
		MoveToNPC(322,264,1,"范纯粹");Sleep(1000)
		flag = false
	elseif MapName == "大理" then
		MoveToNPC(179,121,2,"范纯礼");Sleep(1000)
		flag = false
	elseif MapName == "楼兰" then
		MoveToNPC(191,130,246,"范纯祐");Sleep(1000)
		flag = false
	else
		取消跟随()
		下坐骑()
		local bUse = Skill:UseSkillByName("返回大理城", -1, 400)
		if(bUse) then
			跨图寻路("洛阳",347,249)
		end
		flag = false
	end
end

while (flag) do
 goGuild()
end

执行脚本("[功]挖图专用清包")
--仓库到银行整理|彩棉 龙纹玉灵 麟木箭 炼玉10级 丹青 龙血矿石 彩虹之箭 打造图 缝纫类材 九宫盒 丝线3级 染料3级 高级布片 棉布碎片 琉璃焰 御瑶盘 稀世珍宝图 秘银碎片 精铁碎片 玄天寒玉 低级宝石合成符 宝石雕琢符3级 灵鹫石 五毒珠·元阳 五毒珠·魂武 五毒珠·星眸 绿晶石(1级) 蓝晶石(1级) 黄晶石(1级) 红晶石(1级) 猫眼石(1级) 虎眼石(1级) 石榴石(1级) 月光石(1级) 尖晶石(1级) 祖母绿(1级) 变石(1级) 黄玉(1级) 碧玺(1级) 紫玉(1级) 皓石(1级) 黄宝石(1级) 蓝宝石(1级) 绿宝石(1级) 黑宝石(1级) 红宝石(1级) 缀龙石·元 缀龙石·伤 缀龙石·暴 技能书 玉龙髓 净云水 铸纹血玉 玉华灵泉 
local strItem = AI_GetParameter_User("仓库到银行整理") 

--前后加空格
strItem = " " .. strItem .. " " 

PushDebugMessage("取出物品：" .. strItem)

--参数1：需取出的物品名称 ，空格分开
--参数2：取出的数量
--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
--参数4：整理背包 true 或 false 可空
--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
Bank_GetItem(strItem, -1, -1)

PushDebugMessage("直接去本帮城市了")
QuestFrameOptionClicked("进入本帮城市");Sleep(3000)
输入屏幕文本("#eDC4C18#cFFFF00需要手动点击升级。本任务只是方便多号玩家操作，省去取物品传送的麻烦！！")
if CityToGuild() then
    MoveToNPC(148, 56, -1, "钱为一"); Sleep(1500)
    QuestFrameOptionClicked("帮会银行",1); Sleep(3000)
end
-----结束----------------------