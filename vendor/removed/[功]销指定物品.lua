function ���ұ�����Ʒ(commonItem)
	num = {};
	for i=0,60 do
		local nId = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetID();","n",1)
		if nId~=0 then
			local sName = GetLuaValue("local theAction = EnumAction("..i-1 ..", 'packageitem');return theAction:GetName();","s",1)
			if sName==commonItem then
				for a=0,i-1 do
					num[a] = i-1;
				end
			end
		end
	end
	
	for key,value in ipairs(num) do
		CallFun(5,value);
	end
end
--����������6�Σ���Ʒ��д������
--���5��������һ��
for  i=0,6 do
	���ұ�����Ʒ("���������")
	���ұ�����Ʒ("��������")
	���ұ�����Ʒ("�ȳ����")
end

