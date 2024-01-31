return function (self) 
if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
	return
end
local worldCoinShop = self.WorldCoinShop.WorldCoinShopComponent
if (_UtilLogic.ElapsedSeconds - worldCoinShop.LastOpenTime < 5) then
	_UtilDlgLogic:Show("잠시 후 다시 시도하세요.")
	return
end
if (worldCoinShop:IsVisible()) then
	worldCoinShop:SetVisible(false, true)
else
	worldCoinShop:SetVisible(true, true)
end
end