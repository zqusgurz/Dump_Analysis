return function (self,name,value) 
local function updateIdleAnimation()
	local pet = self.Entity
	if (self.Animation == "IDLE") then
		if (self.Repleteness > 50) then
			pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/stand0", self.TemplateId))
		else
			pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/hungry", self.TemplateId))
		end
	end
end

if (name == "Animation") then
	local pet = self.Entity
	if (value == "HANG") then
		pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/hang", self.TemplateId))
	elseif (value == "JUMP") then
		pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/jump", self.TemplateId))
	elseif (value == "MOVE") then
		pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/move", self.TemplateId))
	elseif (value == "IDLE") then
		self.LastIdle = _UtilLogic.ElapsedSeconds
		updateIdleAnimation()
	else
		pet.SpriteRendererComponent.SpriteRUID = _UidMan:GetAnimation(string.format("Item/Pet/%07d.img/%s", self.TemplateId, value))
	end
	pet.NameTagComponent.Enable = value ~= "HANG"
elseif (name == "Repleteness") then
	updateIdleAnimation()
elseif (name == "PetSkill") then
	_UserService.LocalPlayer.WsUser:UpdateConsume()
end
end