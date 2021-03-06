

--是否可以使用技能
--	返回值：逻辑型		已冷却返回true,未冷却返回false
--  参数1：文本型 		技能名称
local bCan = Skill:CanUseSkillByName("初级隐遁")

--上状态技能
--  参数1：文本型 		技能名称
Skill:CheckBuff("暗器护体")

--使用轻功技能
--  参数1：整数型 		x坐标
--  参数2：整数型 		y坐标
Skill:UseQingGong(123, 456)

--通过技能id使用技能
--  参数1：整数型 		技能ID
--  参数2：整数型 		目标ID，-1则是无目标使用
--	参数3：整数型		一般填0即可
--  参数4；整数型		若使用技能成功延时毫秒
Skill:UseSkillByID(3, 666, 0, 800)

--通过技能名称使用技能
--	返回值：逻辑型		成功使用返回true,否找返回false
--  参数1：文本型 		技能名称
--  参数2：整数型 		目标ID，-1则是无目标使用
--  参数3；整数型		若使用技能成功延时毫秒
local bUse = Skill:UseSkillByName("初级隐遁", -1, 400)


