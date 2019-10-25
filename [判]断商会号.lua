function judgePlayers()
     local playName = GetPlayerInfo("NAME");
     -- players = {
		-- {"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
        -- {"Se⒎蕝蝂哥℡","′梦影．や"," ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
        -- {"ぁ壹葉醬油あ","﹏菲儿、ゝ","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
        -- {"暒涳芐哋埖焱","°﹎紫龍ヤ","天子月","TH－莫囄","ら﹏笨呆呆°","小小书童2"},
        -- {"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
		-- {"小叶丶绝杀","艳歌羅敷行","轻狂∴小可","霂鑰．ゞ","﹏紫．骄傲ゝ","．Lynthia"}
		-- };
		
		-- 如果players里面有角色名称与当前游戏角色名称一致时，则执行聚宝盆
		-- 保持以上格式，最外围一对大括号包含着里面的一具体的人物，人物名称需要用大括号包括着放在最外围的大括号里面
		-- 一队号与另外一队号之前的大括号之间用英文逗号隔开
		-- 此方法可以用于所有需要区分不同角色需要执行不同方法的功能
		
	local players = {
        "Se⒎蕝蝂哥℡",
		"ぁ壹葉醬油あ",
		"逗逗．や",
		"平凡の",
		"ら﹏笨呆呆°",
		"多情的小男人",
		"追逐ゝ",
		"至若",
		"轩轩·",
		"XX丶",
		"Eternally｀L",
	};

	for key,value in ipairs(players)
	do
		--PushDebugMessage(playName);
		if playName == value then
			PushDebugMessage(value .. "准备去商会取藏宝图");
			执行脚本("商会取物")
			return true
		end
		
	end
	PushDebugMessage("执行脚本需要设置扫摊位数量，不然会无限循环扫街脚本，不会退出")
	执行脚本("[09] 扫街喊话收购")
	return true
end

judgePlayers();
