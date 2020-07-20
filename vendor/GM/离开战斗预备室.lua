PushDebugMessage("----------本脚本由QQ1026818119编写----------")

function 判断备战室()
local x坐标,y坐标 = Player_GetPos()
if x坐标 <= 72 and y坐标 <= 72 then return "备战室一"
elseif x坐标 >= 96 and x坐标 <= 168 and y坐标 <= 72 then return "备战室二"
elseif x坐标 >= 182 and y坐标 <= 72 then return "备战室三"
elseif x坐标 <= 72 and y坐标 >= 94 and y坐标 <= 168 then return "备战室四"
elseif x坐标 >= 96 and x坐标 <= 168 and y坐标 >= 94 and y坐标 <= 168 then return "备战室五"
elseif x坐标 >= 182 and y坐标 >= 94 and y坐标 <= 168 then return "备战室六"
elseif x坐标 <= 72 and y坐标 >= 185 then return "备战室七"
elseif x坐标 >= 96 and x坐标 <= 168 and y坐标 >= 185 then return "备战室八"
elseif x坐标 >= 182 and y坐标 >= 185 then return "备战室九"
end
end

function 离开预备室(x)
if GetActiveSceneName() == "宗师战斗预备室" or GetActiveSceneName() == "豪侠战斗预备室" or GetActiveSceneName() == "名士战斗预备室" then 
	if 判断备战室() == "备战室一" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(37, 13, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室二" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(133, 13, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室三" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(219, 13, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室四" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(37, 106, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室五" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(133, 106, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室六" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(219, 106, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室七" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(37, 196, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室八" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(133, 196, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	elseif 判断备战室() == "备战室九" then
	while true do
	if GetActiveSceneName() ~= "宗师战斗预备室" and GetActiveSceneName() ~= "豪侠战斗预备室" and GetActiveSceneName() ~= "名士战斗预备室" then break end
	MoveToNPC(219, 196, -1, "擂台指引使"); Sleep(1000)
	QuestFrameOptionClicked("离开战斗预备室",1); Sleep(1000)
	QuestFrameOptionClicked(x,1); Sleep(1000)
	end
	end
end
end

离开预备室("苏州")
PushDebugMessage("已经不在战斗预备室，结束。")





