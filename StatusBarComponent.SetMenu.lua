return function (self,parent,enabled) 
if (enabled) then
	if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
		return
	end
	_AppService:Get():CloseMenus()
	if (not isvalid(self.ActiveGameMenu)) then
		self.ActiveGameMenu = _SpawnService:SpawnByModelId("model://b3fd0ac5-e92f-4582-b7d9-39995bd8aa35", "GameMenu", Vector3.zero, parent)
		self.ActiveGameMenu.UITransformComponent.Pivot = Vector2(0.5, 0)
		self.ActiveGameMenu.UITransformComponent.anchoredPosition = Vector2(0, 60)
	end
	self.ActiveGameMenu.Enable = true
	_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/MenuUp"), 1)
	_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/DlgNotice"), 1)
else
	if (isvalid(self.ActiveGameMenu)) then
		self.ActiveGameMenu.Enable = false
	end
end
end