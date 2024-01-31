return function (self,parent,enabled) 
if (enabled) then
	if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
		return
	end
	_AppService:Get():CloseMenus()
	if (not isvalid(self.ActiveShortcutMenu)) then
		self.ActiveShortcutMenu = _SpawnService:SpawnByModelId("model://7ba3babf-3523-49e9-aaf2-7915c6cb83a0", "ShortcutMenu", Vector3.zero, parent)
		self.ActiveShortcutMenu.UITransformComponent.Pivot = Vector2(0.5, 0)
		self.ActiveShortcutMenu.UITransformComponent.anchoredPosition = Vector2(0, 60)
	end
	self.ActiveShortcutMenu.Enable = true
	_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/MenuUp"), 1)
	_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/DlgNotice"), 1)
else
	if (isvalid(self.ActiveShortcutMenu)) then
		self.ActiveShortcutMenu.Enable = false
	end
end
end