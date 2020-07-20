function AutoChangYouJia()
	PushDebugMessage('即将进入自动解锁畅游加');Sleep(3000)
	GetLuaValue("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Packet_Clicked();","",3);
	Sleep(500)
	GetLuaValue("setmetatable(_G, {__index = Packet_Env});OpenSafeCenter();","",3);
	Sleep(500)
	GetLuaValue("setmetatable(_G, {__index = SafeCenter_SafeScore_Env});SafeCenter_SafeScore_OpenSafeCheck();","",3);
	Sleep(500)
	GetLuaValue("setmetatable(_G, {__index = SafeCenter_SafeCheck_Env});SafeCenter_SafeCheck_FastCheck_Click();","",3);
	Sleep(1000)
	GetLuaValue("setmetatable(_G, {__index = SafeCenter_SafeCheck_Env});this:Hide();","",3);
	Sleep(1000)
end

local playName; local players;

function waitForPlayers()
     playName = GetPlayerInfo("NAME");
     players = {
        {"°凌筱雨．≈","″．波少ヽ","﹎素颜．や","′雪走","丶漫步ゾ天龙","平凡の"},
        {"Se⒎蕝蝂哥℡","′梦影．","や ﹏岚ゝ兮°","超级↑→奶妈","╰☆TeaR陌ゝ","Am°惜你若命"},
        {"ぁ壹葉醬油あ","Eternally°L","雨林之后","红颜傲﹡．","しF笑天Dす","此生的回矇"},
        {"Eternally｀L","Eternally＇L","至若","獨自一人丶","大雪紛飛丶","小小书童2"},
        {"逗逗．や","豆豆妈咪","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
        -- {"豆豆妈咪","追逐ゝ","情定三世丶","梵魚ˇ","灬枫ヽ昕℃","″踮脚拥他ゝ"},
    };

    for i=1,5 do
        for j=1,6 do
            if playName == players[i][j] then
                time = (j-1)*5*1000;
                PushDebugMessage(players[i][j].."需要等待："..time/60000 .."分钟后运行");
                等待(time);
		AutoChangYouJia();
            end
        end
    end
end

waitForPlayers();



