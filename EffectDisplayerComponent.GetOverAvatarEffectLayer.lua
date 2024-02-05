return function (self,key,updateCostume) 
---@type Entity
local ret = self._overAvatarEffectTable[key]
if (ret == nil) then
	ret = _SpawnService:SpawnByModelId("model://75e405ee-a6b2-4b78-a479-5ed8b247db26", "OverAvatarEffectLayer-"..key, Vector3.zero, self.Entity)
	self._overAvatarEffectTable[key] = ret
	local ar = ret.AvatarRendererComponent
	ar.OrderInLayer = 5
	ar.SortingLayer = "Effect"
	local body = ar:GetBodyEntity()
	body:ConnectEvent(SpriteAnimPlayerEndEvent, 
		function(event)
			self.Entity.CharacterActionComponent:OnSpriteAnimPlayerEndEvent(key, event)
		end	
	)
end
if (updateCostume) then
	local costume = ret.CostumeManagerComponent
    local currentCostume = self.Entity.CostumeManagerComponent
	local cd = self.Entity.WsCharacterData
	--_PlayerCostumeLogic:UpdateCustomCostume(currentCostume, cd.Gender, cd.Face, cd.Hair, cd.AvatarLook)
    _PlayerCostumeLogic:CopyCostume(currentCostume, costume)
    --costume.DefaultEquipUserId = self.Entity.OwnerId
end
return ret
end