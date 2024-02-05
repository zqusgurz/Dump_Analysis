return function (self,npcId) 
local template = _NpcTemplateMan:GetNpcTemplate(npcId)
self.NpcName.Text = _StringMan:GetNpcName(npcId)
if (template.Imitate > 0) then
	self.Avatar.Enable = true
	self.NpcSprite.Entity.Enable = false
	_PlayerCostumeLogic:UpdateImitationNpcLook(npcId, self.Avatar.CostumeManagerComponent)
else
	self.Avatar.Enable = false
	self.NpcSprite.Entity.Enable = true
	self.NpcSprite.ImageRUID = _NpcTemplateMan:EnsureStandAnimation(npcId)
end
end