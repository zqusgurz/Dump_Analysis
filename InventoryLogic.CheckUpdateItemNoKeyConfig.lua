return function (self,itemId) 
if (_ConsumeItemType:CanRegisterKeyConfig(itemId)) then
	local ctrlMan = _AppService:Get().ControlWindowMan
	ctrlMan.KeyConfig.KeyConfigComponent:InvalidateIcon(_FuncKeyTypes.Item, itemId)
	local user = _UserService.LocalPlayer
	if (user.WsUser.ConsumeHP == itemId or user.WsUser.ConsumeMP == itemId) then
		ctrlMan.Equip.EquipWindowComponent:UpdateConsume()
	end
end
end