--九州商店搜索购买物品
function PlayerShopBuyItem(szItem)
	PlayerShop:PacketSend_Search(2,1,1,szItem,1);--搜索
	local pName ,pShopName, pShopID ,pCount ,pPrize = PlayerShop:GetItemPSInfo(0);--读取第一行
		if pName==szItem and pCount >0 and pCount < 3 then
		if pPrize < Player:GetData("MONEY") then
			PlayerShop:SearchPageBuyItem(0, "item")--购买第一项
		else
			PushDebugMessage("海绵宝宝提醒你:金钱不足,无法购买#77");
		end
	end
end


通过hook Lua_dostring 我可以调用类似：
Packet_PackUp_Clicked();//整理包裹功能

Packet_ItemBtnClicked(4,5);//包裹使用物品 4=物品所在包裹行  5=物品所在包裹列

MainMenuBar_Friend_Clicked();//打开好友窗口

LootPacket_Collect_Clicked();//捡物品

问下老师 他们那个GetName 跟EnumAction()是如何调用的！


http://book.luaer.cn/
