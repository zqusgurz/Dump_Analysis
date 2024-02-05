return function (self,b,sfx) 
--log("Set visible ControlTab", self.Entity.Name, " to ", b)
if (b) then
	self:SetFocus()
    --self:CheckMemoryInitFirst()
	self:OnVisible()
	self.Entity.Enable = true
	if (sfx) then
		_SoundService:PlaySound(_EffectLogic.SoundUI["MenuUp"], 1)
	end
else
	if (sfx) then
		_SoundService:PlaySound(_EffectLogic.SoundUI["MenuDown"], 1)
	end
	self.Entity.Enable = false
	self:OnNotVisible()
end
--self.Entity.CanvasGroupComponent.GroupAlpha = b and 1 or 0
--self.Entity.CanvasGroupComponent.BlocksRaycasts = b
--self.Entity.CanvasGroupComponent.Interactable = b
end