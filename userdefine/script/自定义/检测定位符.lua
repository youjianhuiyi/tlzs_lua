--[[
    �ű����ܣ���ⱳ���Ƿ��ж�λ��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-22
]]
local LocationItems = {"��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��"}
-- local flag = true


---------------------------------------------------------------------
-- ��ⶨλ��
---------------------------------------------------------------------
function judgeLocationItems()
	for key,value in ipairs(LocationItems) do
		--����������������������Ʒ
		--����ֵ����Ʒ����
		local tObj = Bag:EnumAllObj()
		for i = 1, #tObj do
			local tmp = tObj[i]
			if tmp.name == value and tmp.count >= 1 then 
				return true
			end
		end
	end
	LoadScript("[09] ɨ�ֺ����չ�")
end

-- ���ĵ���
judgeLocationItems()
