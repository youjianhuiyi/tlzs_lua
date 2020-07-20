--队伍成员所有名称
local strTeam = Team:GetAllName()
MessageBox(strTeam)

--队伍所有成员信息 不包含自己
local tObj = Team:GetAllMemberInfo()
for i = 1, #tObj do
    local tmp = tObj[i]
    local strMsg = string.format(" id:%d\r\n 名称：%s\r\n x:%d\r\n y:%d\r\n 血：%d\r\n 距离：%d\r\n 地图id：%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end

--取出队伍里面  当前剩余血最高的队员
-- 参数1：所在地图
local strName = Team:GetCurrentHPMostMember(GetActiveSceneName())

--取出队伍里面  血上限最高的队员
local strName = Team:GetHPMostMember(GetActiveSceneName())

--获取队长信息
local bTrue, tmp = Team:GetLeaderInfo()
if bTrue then
    local strMsg = string.format(" id:%d\r\n 名称：%s\r\n x:%d\r\n y:%d\r\n 血：%d\r\n 距离：%d\r\n 地图id：%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end

--取队伍人数
local nCount = Team:GetMemberCount()

--取队伍指定名称玩家的信息
local tmp = Team:GetMemberInfoByName("玩家名")
if tmp.id then
    local strMsg = string.format(" id:%d\r\n 名称：%s\r\n x:%d\r\n y:%d\r\n 血：%d\r\n 距离：%d\r\n 地图id：%d\r\n guid:%d", tmp.id, tmp.name, tmp.x, tmp.y, tmp.hp, tmp.dst, tmp.sceneID, tmp.guid)
    MessageBox(strMsg)
end
-- 获取自身在队伍中的索引号 下标从0开始
local nIndex = Team:GetMyIndex()

--取周围的队伍成员,包括自己
--	返回值1：整数型		周围队伍成员数量
--	返回值2：成员数组   
--	参数1：周围的范围距离
local nCount,tObj = Team:GetSurroundMember(9)

--队伍是否有人死亡
local bDie, strName = Team:IsHaveDieMember()
if bDie then 
	MessageBox(strName .. ":已经死亡")
end

--队伍成员数量是否满足 返回逻辑型
local bTrue = Team:IsCountReady(6)

--队伍是否有指定门派
local bHave = Team:IsHaveMenpai("天山")

--队员是否在同 一个地图
local bTrue = Team:IsInSameScene()

Team:CreateTeam()
Team:InviteNear()

--指定地图是否有门派
--	返回值1：逻辑型		
--	返回值2：整数型		血值   
--参数1：地图名称，默认当前地图
--参数2：门派id
local bHave, HPValue = Team:IsSceneHaveFammily("", 4)

--退出队伍
Team:LeaveTeam()

--附近没有队伍成员时退出队伍
Team:LeaveCheckNear()

--同意附近的玩家邀请我入组
Team:AgreeNearInvite()
Team:AgreeNearInvite_2()

--队长：同意附近玩家的申请入组
Team:AgreeNearJoin()

