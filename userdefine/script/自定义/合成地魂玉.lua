--[[
    脚本功能：合成地魂玉数量
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
--核心数量，需要兑换多少个地魂玉，需要手动修改数量
local num = 37

PushDebugMessage("前往凤鸣镇逍遥子")
MoveToNPC(248, 217, 580, "逍遥子")
Sleep(1000)

QuestFrameOptionClicked("合成魂玉")
Sleep(1000)

i = 0
while true do
	QuestFrameOptionClicked("合成地魂玉")
	Sleep(1000)
	i = i +1;
	if (i == num) then
		break;
	end
end
