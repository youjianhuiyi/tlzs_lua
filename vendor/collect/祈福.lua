local _, nCount, _ = FindBagItem(-1, "������")
      if nCount >=1  then
          GetLuaValue("setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();")
           Sleep(1000)
           MessageBox_Self_OK_Clicked()
              else
           PushDebugMessage("��û�и�����޷�������")
      end