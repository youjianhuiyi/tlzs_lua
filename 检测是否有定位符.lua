local LocationItems = {"��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��","��ɫ��λ��"}
-- local flag = true

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
	ִ�нű�("[09] ɨ�ֺ����չ�")
end

-- ���ĵ���
judgeLocationItems()
