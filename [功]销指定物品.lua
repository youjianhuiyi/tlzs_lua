PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ����ٱ�������,�ڽű�����ǰ������������������Ȼ�������٣���������");
local DropCommonItem = {"���������","��������","�ȳ����","��鵿���","��������ʺϳɷ�","�߼���ʯ������","��̫�����˹����"}
local OverNumsItems = {"ս����","������","Ը��Ȫ"}

function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("������Ʒ���ƣ� [" .. value.."]");
			-- �ȴ�(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
end

-- ����ָ����������Ʒ���٣�ս�������������������Ը��Ȫ��
function overNumsItem()
	for key,value in ipairs(OverNumsItems) do
		--����������������������Ʒ
		--����ֵ����Ʒ����
		local tObj = Bag:EnumAllObj()
		for i = 1, #tObj do
			local tmp = tObj[i]
			if tmp.name == value and tmp.count == 20 then 
				CallFun(5,tmp.index)
			end
		end
	end
end

-- ����ָ����������Ʒһ������
overNumsItem()
--����������6�Σ���Ʒ��д������
--���5��������һ��
for i = 1,20 do
	destroyItem();
end
