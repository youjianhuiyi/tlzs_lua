for i = 1, 5 do
    DelBagItem(-1) --????
    local bRet1 = T_eatBindItem() --?????????????????
    DelBagItem(-1) --????
    local bRet2 = BankTemp2Bag("ALL_ITEM", 1) --???????????.????1?????????????????ALL_ITEM???????????
    if bRet1 == false and bRet2 == false then
        break --
    end
    Sleep(100)
end
