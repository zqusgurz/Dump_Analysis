return function (self) 
if (self.NeedUpdateAvatarLook and not _FieldAttributeLogic:IsHiddenUI(nil)) then
	--log("update avatar look")
	self.NeedUpdateAvatarLook = false
	local user = self.Entity
	local cd = user.WsCharacterData
	local blockedMSWAvatar = self:IsBlockedMSWAvatarToMe()
	_PlayerCostumeLogic:UpdateCustomCostume(user.OwnerId, blockedMSWAvatar, user.CostumeManagerComponent, cd.Gender, cd.Face, cd.Hair, cd.Skin, cd.AvatarLook, self.MSWAvatarForPart)
	self:UpdateWeaponAfterImageSfx()
	self:UpdateUserInfoWindowAvatar()
	
	self.Entity.NameTagComponent.NameTagRUID = "9bf18287398c44699c20fc5123d1a1ae"
	self.Entity.NameTagComponent.FontColor = Color.white
	self.Entity.ChatBalloonComponent.ChatBalloonRUID = "7b6bd117bd0446a5bacec8ea6831c997"
	self.Entity.ChatBalloonComponent.FontColor = Color.black
	for i=_BodyParts.Ring1, _BodyParts.Ring4 do
		local itemId = _PlayerCostumeLogic:GetItemIdFromBodyParts(cd.AvatarLook, i)
		if (itemId == 0) then
			continue
		end
		local nameTag = _ItemInfoMan.NameTags[itemId]
		if (not nameTag) then
			continue
		end
		local n = nameTag.NameTag
		local c = nameTag.Chat
		local color = nameTag.Color
		if (n) then
			self.Entity.NameTagComponent.NameTagRUID = n
			if (color) then
				self.Entity.NameTagComponent.FontColor = color
			end
		end
		if (c) then
			self.Entity.ChatBalloonComponent.ChatBalloonRUID = c
			if (color) then
				self.Entity.ChatBalloonComponent.FontColor = color
			end
		end
	end
end
end