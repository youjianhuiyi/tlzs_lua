PushDebugMessage("#eDC4C18#cFFFF00 Զ�̶һ�����ʯ")
------- ��ʼ----------------------------------
������Ļ�ı�("#eDC4C18#cFFFF00��ʼ�Զ�ɨ�����")
local g_szItemName = AI_GetParameter("�ֿ�ȡ��")
	--����1����ȡ������Ʒ���� ���ո�ֿ�
	--����2��ȡ��������
	--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵� �ɿ�
	--����4�������� true �� false �ɿ�
	--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵� �ɿ�
local nCnt = Bank_GetItem(" ����ʯ��Ƭ ", 31, 1)
GetLuaValue("Clear_XSCRIPT();Set_XSCRIPT_Function_Name('DuiHuanOK');Set_XSCRIPT_ScriptID(890174);Set_XSCRIPT_ParamCount(0);Send_XSCRIPT();","",0)	