return function (self,ruid,animObject) 
local defFrameData = _AnimationMan:GetAnimationFrameData(animObject["0"], self.DefaultAnimationDelay)
self:ClearAlphaTween(defFrameData)
_TimerService:ClearTimer(self._T.FinishTimer)
local sp = self:GetSpriteEntity()
if (self.UpdateCollider) then
    self:UpdateColliderBox(defFrameData)
	
end
sp.TransformComponent.Position = Vector3.zero
sp.Visible = true
if (self.UIMode) then
	if (not self.Loop) then
		self:GetGUIRenderer().AnimClipPlayType = SpriteAnimClipPlayType.Onetime
	end
end
local renderer = self:GetRenderer()
sp.SpriteRendererComponent.StartFrameIndex = 0
sp.SpriteRendererComponent.EndFrameIndex = 2147483647
sp.SpriteRendererComponent.PlayRate = 1
sp.SpriteRendererComponent.SpriteRUID = ruid

local i = 0
local accumulatedDelay = 0
local renderer
if (self.UIMode) then
	renderer = self:GetGUIRenderer()
else
	renderer = self:GetRenderer()
end
while true do
	local frame = animObject[tostring(i)]
	if (frame == nil) then
		break
	end
	local anim =_AnimationMan:GetAnimationFrameData(frame, self.DefaultAnimationDelay)
	if (anim.Delay > 0) then
		if (not self.NoApplyAlpha) then
			if (anim.A0 ~= 1 or self._T.LastAlpha ~= 1) then
				renderer.Color.a = anim.A0
			end
			if (anim.A0 ~= anim.A1) then
	            local tw = _TweenLogic:MakeTween(anim.A0, anim.A1, (accumulatedDelay + anim.Delay)/1000, EaseType.Linear, function(f)
	                if (isvalid(renderer)) then
	                    renderer.Color.a = f
	                end
	            end)
				tw.Delay = accumulatedDelay/1000
	            tw.AutoDestroy = true
	            self._T.AlphaTween = tw
	            tw:Play()
			end
			self._T.LastAlpha = anim.A1
		end
		accumulatedDelay += anim.Delay
	end
	i += 1
end
if (self.ActionWhenAnimationOnceEnd ~= nil or self.DisappearWhenAnimationOnceEnd or self.TransparentWhenAnimationOnceEnd) then
	self._T.FinishTimer = _TimerService:SetTimerOnce(function() self:OnFinishSpriteAnim() end, accumulatedDelay/1000)
end
if (self.ActionWhenAnimationOnceEnd ~= nil or self.DisappearWhenAnimationOnceEnd or self.TransparentWhenAnimationOnceEnd or not self.Loop) then
	self._T.EndFrame = i - 1
	self._T.EndFrameHandler = sp:ConnectEvent(SpriteAnimPlayerEndFrameEvent, function(ev) self:OnSpriteAnimEndFrame(ev) end)
end
-- a0, a1
-- z0, z1
-- lt, rb (trap)
end