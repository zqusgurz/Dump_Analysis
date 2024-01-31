return function (self) 
self.Entity.SpriteRendererComponent.Enable = false

local localPlayer = _UserService.LocalPlayer
if (_ImitationNpcLogic:HasImitationNpcRecord(self.NpcTemplateID, localPlayer.OwnerId, localPlayer.WsUser.CharacterId)) then
	self.Entity.NameTagComponent.Enable = true
	self.Entity.TouchReceiveComponent.Enable = true
	self.Entity.AvatarRendererComponent.Enable = true
	_PlayerCostumeLogic:UpdateImitationNpcLook(self.NpcTemplateID, self.Entity.CostumeManagerComponent)
	self.Entity.NameTagComponent.Name = _StringMan:GetNpcName(self.NpcTemplateID)
else
	self.Entity.AvatarRendererComponent.Enable = false
	self.Entity.NameTagComponent.Enable = false
	self.Entity.TouchReceiveComponent.Enable = false
end
end