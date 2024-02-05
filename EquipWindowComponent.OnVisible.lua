return function (self) 
--log("OnVisible EquipWindow")
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Equip))
self:UpdateEquipment()
self:UpdateConsume()
end