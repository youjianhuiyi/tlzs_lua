--[[
至若老板号接收交易物品
--]]
local items = " 麟木箭 丹青 彩虹之箭 九宫盒 纫革10级 炼玉10级  督脉运功典藏 手少阳脉运功典藏 任脉运功典藏 秘籍 要诀 雕纹图样 鉴定符10级 鉴定书10级 通用鉴定卷轴10级 灵魂碎片·黄 雕纹蚀刻溶剂 掌柜要诀 精铁碎片 玄天寒玉 五毒珠·元阳 五毒珠·魂武 五毒珠·星眸 丝线3级 染料3级 ";
local players = {
	"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の",
	"Se⒎蕝蝂哥℡","′梦影．や"," ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命",
	"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇",
	"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2",
	"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ",
	"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia",
	"﹎仙乐°","ˊ疾风剑豪ゝ","＂蔓蔓轻歌ゝ","′慕清枫．や","″う流漓","╰ˋ凉皮．﹡"
};

function main()
	-- 第一步,先销毁背包里面的宝宝肉
	执行脚本("[功]销指定物品")
	-- 第二步，先取出天机锦囊里面的所有需要取出的物品
	执行脚本("锦囊取物")
	-- 第三步，将取出来的物品存仓一次
	执行脚本("[功能] 物品存仓")
	-- 第四步，将取出来的物品存仓一次
	执行脚本("加工材料")
	local g_szItemName = AI_GetParameter("仓库取物")
	--参数1：需取出的物品名称 ，空格分开
	--参数2：取出的数量
	--参数3：需取出的绑定状态 0无所谓 1不绑的 2绑定的 可空
	--参数4：整理背包 true 或 false 可空
	--参数5：需取出的锁定状态 0无所谓 1不绑的 2绑定的 可空
	local nCnt = Bank_GetItem(items,1000,1,true)
	for i = 1 , 4 do
		执行脚本("交易给老板号");Sleep(100);
	end
end
-- 执行主控
main()
-- 完成之后执行买卖补给
MoveToNPC(343,246,1,"梁伙计");Sleep(1000)