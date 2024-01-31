return function (self,anim,firstChanged) 
self:ClearAlphaTween(anim)
self:ClearAnimationTween()

if (self.UpdateCollider and firstChanged == true) then
    self:UpdateColliderBox(anim)
end

self._T.currentAnim = anim
local renderer
if (not self.UIMode) then
	renderer = self:GetRenderer()
	renderer.SpriteRUID = anim.RUID --obj:_GetValue_String()
else
	renderer = self:GetGUIRenderer()
	local uiTransform = renderer.Entity.UITransformComponent
	renderer.ImageRUID = anim.RUID --obj:_GetValue_String()
end
self:_SetOriginOffset()
local e = renderer.Entity
if (firstChanged and not e.Visible) then
	_UpdateComponentLogic:InsertUpdateVisible(e)
end

if (anim.Delay > 0) then
	if not (self.NoApplyAlpha) then
		if (anim.A0 ~= 1 or self._T.LastAlpha ~= 1) then
			renderer.Color.a = anim.A0
		end
		if (anim.A0 ~= anim.A1) then
			local tw = _TweenLogic:MakeTween(anim.A0, anim.A1, anim.Delay/1000, EaseType.Linear, function(f)
				if (isvalid(renderer)) then
					renderer.Color.a = f		
				end
			end)
			tw.AutoDestroy = true
			self._T.AlphaTween = tw
			tw:Play()
		end
		self._T.LastAlpha = anim.A1
	end
end

return anim.Delay
end