--[[
	�ű����ã��ж��Ƿ����̻������飬����Ǻ�����飬��ֱ�Ӵ��̻�ȡ���ر�ͼ��������ͼ
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


---------------------------------------------------------------------
-- �ж��Ƿ����̻������飬����Ǻ�����飬��ֱ�Ӵ��̻�ȡ���ر�ͼ
---------------------------------------------------------------------
function judgePlayers()
    local playName = GetPlayerInfo("NAME");
	LoadScript('allPlayers.lua')

	for key,value in ipairs(cooperativePartnerPlayers)
	do
		if playName == value then
			PushDebugMessage(value .. "׼��ȥ�̻�ȡ�ر�ͼ");
			LoadScipt("�̻�ȡ��")
			return true
		end
		
	end
	PushDebugMessage("ִ�нű���Ҫ����ɨ̯λ��������Ȼ������ѭ��ɨ�ֽű��������˳�")
	LoadScipt("[09] ɨ�ֺ����չ�")
	return true
end

---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
judgePlayers();
