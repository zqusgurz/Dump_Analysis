return function (self,actionId,masteryLevel,left,afterImageDelay,sfx) 
local afterImage = self.CurrentWeaponAfterImage
local currentWeaponSfx = self.CurrentWeaponSfx

local actionName = _CharacterAction:GetActionString(actionId)
local afterImageData = _AfterImageLogic:GetAfterImage(afterImage, actionName, masteryLevel)

if (afterImageDelay > 0) then
	if (isvalid(self.AfterImage.ColliderVisualizer) and self.AfterImage.ColliderVisualizer.Enable) then
		self.AfterImage.ColliderVisualizer:SetGizmoState(TriggerComponent, true)
		self.AfterImage.ColliderVisualizer:OnRefresh(TriggerComponent)
	end
	_TimerService:ClearTimer(self.AfterImageTimer)
	self.AfterImageTimer = _TimerService:SetTimerOnce(function()
		-- ColliderVisualizer가 있으면 AfterImage 표시할 때 활성화 시킨다.
        --if (isvalid(self.AfterImage.ColliderVisualizer) and self.AfterImage.ColliderVisualizer.Enable) then
        --    self.AfterImage.ColliderVisualizer:SetGizmoState(TriggerComponent, true)
        --end
		if (sfx) then
			local sfxSubName = "Attack"
			local sfxRUID = _EffectLogic.SoundWeapon[currentWeaponSfx][sfxSubName]
			_SoundService:PlaySoundAtPos(sfxRUID, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
		end
		if (afterImageData) then
			self.AfterImage.AfterimageComponent:SetAnimation(afterImageData, left)
		end
	end, afterImageDelay)
end
end