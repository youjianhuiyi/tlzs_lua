--[[
	�ű����ã�����ɫ���ϵ�Ԫ���һ���Ԫ��Ʊ���Զ�������
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


---------------------------------------------------------------------
-- ִ�а��۱���Ľ�ɫ
---------------------------------------------------------------------
function goToCornucopia()
	local playName = GetPlayerInfo("NAME");
    LoadScript("allPlayers.lua");

	for key,value in ipairs(cornucopiaPlayers) do
		PushDebugMessage("#eDC4C18#cFFFF00 "..playName.."-- ��Ҫȥ�۱��裬���ƻ�û��");
		if playName == value then
			PushDebugMessage("#eDC4C18#cFFFF00 "..value .. "׼��ȥ���۱���");
			LoadScript("���۱���")
		end
	end

end


---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
goToCornucopia();