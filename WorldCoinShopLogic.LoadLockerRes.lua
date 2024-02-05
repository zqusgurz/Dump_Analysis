return function (self,value) 
local win = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
win:SetLockerItems(value)
win.LockerLoadingOverlay.Enable = false
end