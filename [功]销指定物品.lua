PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ����ٱ�������,�ڽű�����ǰ������������������Ȼ�������٣���������");
DropCommonItem = {"���������","��������","�ȳ����","��鵿���"}

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
--����������6�Σ���Ʒ��д������
--���5��������һ��
for i = 1,20 do
	destroyItem();
end
