return function (self) 
self.CurrentAvatarAction = 0
self:ChangeAvatarAction(1)
self:ChangeTab(1)
self:AvatarReset(false)
self.LoadingOverlay.Enable = true
if (not _WorldCoinShopLogic.LoadingShop) then
	_WorldCoinShopLogic.LoadingShop = true
	_WorldCoinShopLogic:UpdateProducts(true)
	self.LockerLoadingOverlay.Enable = true
	_WorldCoinShopLogic:LoadLocker(_UserService.LocalPlayer)
end
self.LastOpenTime = _UtilLogic.ElapsedSeconds
end