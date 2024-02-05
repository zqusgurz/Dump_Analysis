return function (self,firstChanged) 
self._tween = 0
local obj = self._obj
self._currentIndex = self._currentIndex + self._T.increment
if (obj[tostring(self._currentIndex)] == nil) then
	if (self._T.zigzag == true) then
		local beforeIndex = self._currentIndex
		self._T.increment = -self._T.increment
		self._currentIndex += self._T.increment * 2
		--log("Before:"..beforeIndex.."  / After:"..self._currentIndex)
	else
		if (self.ActionWhenAnimationOnceEnd ~= nil) then
			--log("return animation to " .. self.ActionNameWhenAnimationOnceEnd)
			if (self.ActionWhenAnimationOnceEnd.Asset ~= nil) then
				self:SetAssetAnimation(self.ActionWhenAnimationOnceEnd.Asset, self.ActionWhenAnimationOnceEnd.Anim)
			else
				self:SetWzSprite(self.ActionWhenAnimationOnceEnd.Anim, true)
			end
			self.ActionWhenAnimationOnceEnd = nil
			return
		end
		if (self.DisappearWhenAnimationOnceEnd) then
			self:GetSpriteEntity().Visible = false
		end
		if (self.TransparentWhenAnimationOnceEnd) then
			if (self.UIMode) then
				self:GetGUIRenderer().Color.a = 0
			else
				self:GetRenderer().Color.a = 0
			end
			self.NoApplyAlpha = true
		end
		if (self.ReleasePool ~= nil) then
			_ObjectPool:Release(self.ReleasePool, self.Entity)
			self.ReleasePool = nil
		end
		if not (self.Loop) then
			--log ("sprite animation was end")
			--[[if (isvalid(self.Entity.TriggerComponent) and self.Entity.TriggerComponent.Enable) then
				self.Entity.TriggerComponent.Enable = false
				if (isvalid(self.Entity.ColliderVisualizer)) then
					self.Entity.ColliderVisualizer:SetGizmoState(TriggerComponent, false)
				end
			end]]--
			return
		end
		--log ("returning to first sprite")
		self._currentIndex = 0
	end
end
local delay = self:_SetSprite(self._currentIndex, firstChanged)
self._tween = _TimerService:SetTimerOnce(self.NextFrame, delay / 1000)
end