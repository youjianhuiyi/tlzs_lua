function 领周活跃箱子()
	for i = 1,3 do
		GetLuaValue(string.format([[
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("WeekHuoyuePrize");
				Set_XSCRIPT_ScriptID(889337);
				Set_XSCRIPT_Parameter(0,%d);
				Set_XSCRIPT_ParamCount(1);
			Send_XSCRIPT();
			]],i));Sleep(1000)
	end
end
领周活跃箱子()