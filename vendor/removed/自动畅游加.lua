function AutoChangYouJia()
	PushDebugMessage('���������Զ��������μ�');Sleep(3000)
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
        {"�������꣮��","�壮���٩c","�m���գ���","��ѩ��","ؼ����������","ƽ����"},
        {"Se��ʅ�Z��Y","����Ӱ��","�� �nᰩf���","������������","�t��TeaRİ�f","Am��ϧ������"},
        {"��Ҽ�~�u�ͤ�","Eternally��L","����֮��","���հ��~��","��FЦ��D��","�����Ļز�"},
        {"Eternally��L","Eternally��L","����","����һ��ؼ","��ѩ���wؼ","СС��ͯ2"},
        {"��������","��������","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
        -- {"��������","׷��f","�鶨����ؼ","���~��","���c꿡�","���ڽ�ӵ���f"},
    };

    for i=1,5 do
        for j=1,6 do
            if playName == players[i][j] then
                time = (j-1)*5*1000;
                PushDebugMessage(players[i][j].."��Ҫ�ȴ���"..time/60000 .."���Ӻ�����");
                �ȴ�(time);
		AutoChangYouJia();
            end
        end
    end
end

waitForPlayers();



