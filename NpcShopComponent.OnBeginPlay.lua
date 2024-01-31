return function (self) 
self.BuyTab:ConnectEvent(ChangeTabEvent, self.OnBuyTabChanged)
self.SellTab:ConnectEvent(ChangeTabEvent, self.OnSellTabChanged)
self.ItemBuyButton:ConnectEvent(ButtonClickEvent, self.OnTryBuying)
self.ItemSellButton:ConnectEvent(ButtonClickEvent, self.OnTrySelling)
self.ExitShopButton:ConnectEvent(ButtonClickEvent, self.CloseShop)
self:EnsureItemEntriesForDemand(self.BuyItemEntries, self.BuyItemSeparators, self.BuyItemList, 96)
self:EnsureItemEntriesForDemand(self.SellItemEntries, self.SellItemSeparators, self.SellItemList, 96)
end