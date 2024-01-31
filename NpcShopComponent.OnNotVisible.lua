return function (self) 
-- Close shop
_NpcShopMan:CloseShop(_UserService.LocalPlayer)
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.NpcShop))
end