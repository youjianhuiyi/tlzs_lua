--[[
    �ű����ܣ�Ǯׯ�ϼ������Զ�ȡǮׯ��ƷȥǮׯ���Ͻ���
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]
local YBItems = " ����飨1���� ��Ԫ�� �����3�� ʥ���� ���˿ ������ʯ ���޾��� ���ʯ ���޵����ϣ�1���� ���޵����磨1���� ���޵����䣨1���� ���޵�����1���� ���ʯ������1���� ���ʯ���ƣ�1���� ���ʯ������1���� ���ʯ������1���� ��Ԫ���� ǧ������ �ٴ����� ����ʯ ������ ���з��� ԡ��ʯ �����۱�������  ��������������  ��������������  �����ƶ�������  ��������������  ��������������  ��������������  ��������������  �ơ�����������  �ơ�����������  �ơ�����������  �ơ��ȶ�������  ��������������  ��������������  ��������������  �����ζ������� ��Ҷ����Ƭ ";
-----------------------------------------------------------
-- �жϱ�������Ľű�
-----------------------------------------------------------
function judgeBagIsEmpty()
    local tObj = Bag:EnumAllObj()
	local n = 0
	local m = 0
	for i = 1, #tObj do
		local tmp = tObj[i]
		if tmp.index <= 29 then 
			n = n + 1
		elseif tmp.index > 29 and tmp.index < 60 then 
			m = m + 1
		end
	end
	return {bag1 = n,bag2 = m}
end


-----------------------------------------------------------
-- �����⽻������Ϊ��ʱ���ǴӶ�ʱ�����ģ���ֹ��
-----------------------------------------------------------
function destroyItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value,0)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("#b#eff00ff ������Ʒ���ƣ� [" .. value.."]");
			-- �ȴ�(50)
			CallFun(5,nIndex);
			Sleep(10);
		end
	end
end


-----------------------------------------------------------
-- �����߼� 
-----------------------------------------------------------
function _sMain()
    local bags = judgeBagIsEmpty();
    if bags[bag1] >20 or bags[bag2] > 20 then
        LoadScript("[����] ��������")
        LoadScript("�ӹ�����")
        LoadScript("[����] ��Ʒ���")
        for i=1,4 do
            destroyItem();
        end
    

        local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
        --����1����ȡ������Ʒ���� ���ո�ֿ�
        --����2��ȡ��������
        --����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
        --����4�������� true �� false �ɿ�
        --����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
        local nCnt = Bank_GetItem(YBItems,31,1);
        PushDebugMessage("#b#eff00ffֱ��ȥǮׯ��")
    end

    ��ͼѰ·("Ǯׯ",92,100)
end


-----------------------------------------------------------
-- ���ĵ���
-----------------------------------------------------------
_sMain()