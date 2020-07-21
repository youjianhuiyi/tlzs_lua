--[[
	脚本作用：判断是否是商会合作伙伴，如果是合作伙伴，则直接从商会取出藏宝图，进行挖图
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]


---------------------------------------------------------------------
-- 判断是否是商会合作伙伴，如果是合作伙伴，则直接从商会取出藏宝图
---------------------------------------------------------------------
function judgePlayers()
    local playName = GetPlayerInfo("NAME");
	LoadScript('allPlayers.lua')

	for key,value in ipairs(cooperativePartnerPlayers)
	do
		if playName == value then
			PushDebugMessage(value .. "准备去商会取藏宝图");
			LoadScipt("商会取物")
			return true
		end
		
	end
	PushDebugMessage("执行脚本需要设置扫摊位数量，不然会无限循环扫街脚本，不会退出")
	LoadScipt("[09] 扫街喊话收购")
	return true
end

---------------------------------------------------------------------
-- 核心调用
---------------------------------------------------------------------
judgePlayers();
