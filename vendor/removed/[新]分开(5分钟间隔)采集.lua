--[[�ȴ�������ɲɿ�--]]
local playName; local players;
function waitForFriendToMine()
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
                time = (j-1)*300*1000;
                PushDebugMessage(players[i][j].."��Ҫ�ȴ���"..time/60000 .."���Ӻ�����");
                �ȴ�(time);
				ִ�нű�("[02] �ɼ��ű�");
            end
        end
    end
end


waitForFriendToMine();
