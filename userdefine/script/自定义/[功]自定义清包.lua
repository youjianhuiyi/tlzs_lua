--[[
	�ű����ã���ͼר�������ר����һЩ��װ����δ������װ���������Զ���һЩ��Ʒ�����������ű�ִ�е�ʱ���벻Ҫ���������͵���������Ʒλ��
	author:yulinzhihou
	email:yulinzhihou@gmail.com
	github:https://github.com/yulinzhihou
	Date:2020-07-21
]]

PushDebugMessage("#eDC4C18#cFFFF00 #81�Զ�������ͼ�İ���׼��,�ڽű�����ǰ��������������������Ȼ�������٣���������");
-- �˷�������ǿ������ϵͳ�͵�װ�����������Ҫֱ�Ӽ����ٵ�װ��������ֱ����������������������ӡ��뱣�ָ�ʽһ��
local DropCommonItem = {
"�ٱ����⣺������","�ٱ����⣺Ҷ����","�ٱ����⣺������","���ݵ���ѩ��","���ݵ�������","�����纮ñ","�����纮����","�����纮Ь","�����纮ָ��","�����纮����","��Ӱ�λ�ñ","��Ӱ�λ�����","��Ӱ�λ�Ь","��Ӱ�λ�ָ��","��Ӱ�λ�����","������ñ","�����滤��","������Ь","������ָ��","�����滤��","������ɷñ","������ɷ����","������ɷЬ","������ɷָ��","������ɷ����","�ޱ��ֻ�","�ޱ���˿","�ޱ�֮Ը","�ޱ�֮��","��嫻���","���֮��","���֮��","���֮��","����","�������ɿ�","��������Ь","������Ӱ��","�������μ�","ѩ���黨��","ѩ���黨��","ѩ��֮��","ѩ��֮��","����ݸ���","����֮��","����֮��","����֮��","����","����������","���������","��������צ","��������֮��","��Ů�����","��Ů����","��Ů֮��","��Ů֮Դ","ն��֮��","ն�����Ȼ���","ն��֮��","ն��֮ڤ","����","���������","��������Ь","����������","�������䷨��","������Ӱ��","��������","����֮ӿ","����֮��","ˮ��֮��","ˮ��̽���","ˮ��֮��","ˮ��֮��","����","����ڤ���","����ڤ��Ь","����ڤ����","����ڤ��","���İ˻ļ�","��������","����֮�","����֮��","��ˮ������","��ˮ֮��","��ˮ֮��","��ˮ֮��","����","����������","��������Ь","����������","��������֮����","���������","�������","���֮��","���֮ϸ��","�ٻ�ܿ�Ụ��","�ٻ�֮��","�ٻ�֮��","�ٻ�֮��","����","����к����","����к��Ь","����к����","����к�����ջ�","�����ۻ��","�����ۻ�֮��","����֮��","����֮��","�ϳ�","����֮��","�������Ȼ���","����֮��","����֮�","����","���������","��������Ь","����������","���������","����������","����","��������","����֮��","����֮ˮ","ն��֮Ӱ","ն��������","ն��֮��","ն��֮Ĭ","����","��������֮��","��������֮Ь","��������֮��","��������֮��","��Ц��ɣ��","��Ц����","��Ц֮��","��Ц֮��","�л�֮ѩ","�л����μ�","�л�֮��","�л�֮��","����","���������","��������Ь","����������","����������","ŭӧ֮��","ŭӧ��ָ","ŭӧ֮��","ŭӧ����","���","��潫��","��潫��","�������","��潫ѥ","Ѫ������","Ѫ�н�ָ","Ѫ�л���","Ѫ�л���","˷��","˷�����Ϲ�","˷������ѥ","˷��������","˷��������","�칤ǧ����","��潫��","�������","��潫ѥ","Ѫ������","Ѫ�н�ָ","Ѫ�л���","Ѫ�л���","��΢����","��΢�����","��΢����ѥ","��΢������","��΢������","��ڤҡ���","��潫��","�������","��潫ѥ","Ѫ������","Ѫ�н�ָ","Ѫ�л���","Ѫ�л���","��¬ǹ","������","ԧ�쵶","������","���ﻷ","ˮ����","ˮ����","����","��ս","����","δ��","տ¬","��Ԩ","����","����","����","���","̫��","ն��","���󻢹���","�鱦��","�����滨��","��ڤ��","���봩��","ʥ��֮���","����֮���","��Ħ֮���","ʥ��֮���","����֮���","��Ů֮����","�޼�֮����","�Ķ�֮����","��Ů֮Ī��","�޼�֮Ī��","�Ķ�֮Ī��","����֮ĩ·","��ڤ֮ĩ·","����֮ĩ·","����֮��Ȫ","��ڤ֮��Ȫ","����֮��Ȫ","����֮����","�ݺ�֮����","��Ħ֮�������","ʥ��֮�������","����֮�������","��Ů֮�鶯���","�޼�֮�鶯���","�Ķ�֮�鶯���","����֮��ñ","��ڤ֮��ñ","����֮��ñ","��Ħ֮����ʥѥ","ʥ��֮����ʥѥ","����֮����ʥѥ","��Ů֮�鶯��ѥ","�޼�֮�鶯��ѥ","�Ķ�֮�鶯��ѥ","����֮��ʥ��","��ڤ֮��ʥ��","����֮��ʥ��","��Ħ֮�����ּ�","ʥ��֮�����ּ�","����֮�����ּ�","��Ů֮�鶯����","�޼�֮�鶯����","�Ķ�֮�鶯����","����֮�⥻���","��ڤ֮�⥻���","����֮�⥻���","��Ħ֮��������","ʥ��֮��������","����֮��������","��Ů֮�鶯����","�޼�֮�鶯����","�Ķ�֮�鶯����","����֮������","��ڤ֮������","����֮������","��Ħ֮����ʥ��","ʥ��֮����ʥ��","����֮����ʥ��","��Ů֮�鶯ʥ��","�޼�֮�鶯ʥ��","�Ķ�֮�鶯ʥ��","����֮��ħ��","��ڤ֮��ħ��","����֮��ħ��","��Ħ֮����ʥ��","ʥ��֮����ʥ��","����֮����ʥ��","��Ů֮�鶯ʥ��","�޼�֮�鶯ʥ��","�Ķ�֮�鶯ʥ��","����֮��ʥ��","��ڤ֮��ʥ��","����֮��ʥ��","���긫","��¹Ѹ��","����������","�ɻ���","�̺�������","Ƕ����ͷ��","����","������","����","˫ͫ","¹��ǹ","�°�","����","ʯ��","����","����","ŭ��","����","����","����","ɳ��","��Ѫ","ɺ����","������","�ĸ���","����","��Ҷ��","��ɪ�","����������","����������","������","������","¥���˱���","����������","������","������","Ī��ñ","��¥ñ","�޵���","��½�","��Դñ","�����","��ɳ��","���ؽ�","���ñ","��ū��","��Ӫ��","��֪��","Ī��Ь","��¥Ь","��ңѥ","����ѥ","��Դѥ","����ѥ","����Ь","����Ь","���ѥ","��ūսѥ","��ţЬ","����ѥ","Ī���","��¥����","濾껤��","��Ļ���","��Դ����","������","��Ȫ����","������","�����","��ū����","ѪӰ��","��ԯ��","Ī����","��¥��","ʨ������","�߲���","��Դ��","������","������","������","�����","��ū��","�ػ���","������","���߻���","��ʻ���","�̷�","����","���ֻ���","ʥ���","��ʯ��","���¼�","��ҹ","������","����ɳ��","��¶��","Ѫ���","�����","ʾ�Ǵ�","���ɴ�","��Ϣָ��","���ӽ�ָ","�˰�","����ҹ","��","�������","�ڵ»���","ӥ������","������","����֮��","Х�커��","��ħ����","����ָ�� ","���鷨��","����ָ��","���ݷ���","����ָ��","��ת�컥��","�˺�������","��ķ������","���𻤷�","����֮��","Х�취��","��ħ����","���񻤷�","�������","��������","���ݷ���","���ջ���","��ת�컥��","�˺�������","��ķ������","ŭ��","����","����ǹ ","��ɽ�� ","��� ","̫�� ","̽��","���������","��������","�ȳ����"}
local DropDefineItem = {"���������","��������","�ȳ����","��鵿���","��������ʺϳɷ�","�߼���ʯ������","��̫�����˹����"}
local OverNumsItems = {"ս����","������","Ը��Ȫ","��ç���7��"}

---------------------------------------------------------------------
-- ѭ�����Ҳ���������
---------------------------------------------------------------------
function DoDropItem()
	for key,value in ipairs(DropCommonItem) do
		local bFind, nIndex = Bag:FindBagItem_DJ(value, 0)
		--MessageBox(nIndex)
		if bFind == true and nIndex ~= -1 then
			PushDebugMessage("#eDC4C18#cFFFF00 ����װ�����ƣ� [" .. value.."]");
			Sleep(50);
			-- �ȴ�(50)
			CallFun(5,nIndex);
		end
	end
end

---------------------------------------------------------------------
-- ����ָ����������Ʒ���٣�ս�������������������Ը��Ȫ��
---------------------------------------------------------------------
function overNumsItem()
	for key,value in ipairs(OverNumsItems) do
		--����������������������Ʒ
		--����ֵ����Ʒ����
		local tObj = Bag:EnumAllObj()
		for i = 1, #tObj do
			local tmp = tObj[i]
			if tmp.name == value and tmp.count >= 250 then 
				CallFun(5,tmp.index)
			end
		end
	end
end

---------------------------------------------------------------------
-- ���ĵ���
---------------------------------------------------------------------
for i = 1,10 do
  DoDropItem()
  overNumsItem()
  PushDebugMessage("#eDC4C18#cFFFF00 ����ִ�����������ڣ� [" .. i.."] ��");
end