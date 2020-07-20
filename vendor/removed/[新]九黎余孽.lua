﹏岚ゝ兮° 超级↑→奶妈 ╰☆TeaR陌ゝ Am°惜你若命 Se⒎蕝蝂哥℡ ﹎素颜．や 丶漫步ゾ天龙 ′雪走 ″．波少ヽ °凌筱雨．≈ 平凡の °﹎紫龍ヤ 天子月 TH－莫囄 小小书童2 至若 ら﹏笨呆呆°

PushDebugMessage("开始每天聚宝盆") 
--获取当前用户名称，判断是否需要买令牌相关物品
local PlayerName = GetPlayerInfo("NAME")
--Players1表示要聚宝盆
local Players1 = {"°﹎紫龍ヤ","天子月","TH－莫囄","小小书童2","至若","ら﹏笨呆呆°","﹎素颜．や","丶漫步ゾ天龙","′雪走","″．波少ヽ","°凌筱雨．≈","平凡の","″踮脚拥他ゝ","红颜傲﹡．","﹏菲儿、ゝ","此生的回矇","﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命","′梦影．","や Se⒎蕝蝂哥℡"};
--Players2表示不要聚宝盆
local Players2 = {"情定三世丶","灬枫ヽ昕℃","梵魚ˇ","豆豆妈咪","逗逗．や","しF笑天Dす","雨林之后","ぁ壹葉醬油あ"};
--Players1表示买黄晶石
for key,value in ipairs(Players1) do
	if PlayerName == Players1[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81准备聚宝盆#81")
		执行脚本("帮会聚宝盆");
	end
end
--Players2表示买蓝晶石
for key,value in ipairs(Players2) do
	if PlayerName == Players2[key] then
		PushDebugMessage("#eDC4C18#cFFFF00 #81我们不需要聚宝盆#81")
		执行脚本("帮会聚宝盆");
	end
end
