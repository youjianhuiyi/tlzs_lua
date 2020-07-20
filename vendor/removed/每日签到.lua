function _SMain()
	--GetLuaValue("setmetatable(_G, {__index=PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(15)","",0)
	Sleep(1000)
	GetLuaValue([[
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("CheckTodaySign")
			Set_XSCRIPT_ScriptID(891106)
			Set_XSCRIPT_ParamCount(0)
		Send_XSCRIPT()

	]],"",0)
	Sleep(1000)
	CloseWindow("Fuli_MonthlySign")
	
end

_SMain()

