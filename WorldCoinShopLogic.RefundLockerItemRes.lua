return function (self,id) 
local win = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
win:OnRefundRes(id)
win.LockerLoadingOverlay.Enable = false
end