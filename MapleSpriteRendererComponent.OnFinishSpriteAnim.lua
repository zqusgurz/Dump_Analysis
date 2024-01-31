return function (self) 
if (self.ActionWhenAnimationOnceEnd ~= nil) then
	local assetAnim = self.ActionWhenAnimationOnceEnd.AssetAnim
	local anim = self.ActionWhenAnimationOnceEnd.Anim
	if (assetAnim ~= nil) then
		self:SetAssetAnimation(assetAnim, anim)
	else
		self:SetWzSprite(anim, true)
	end
	self.ActionWhenAnimationOnceEnd = nil
end
if (self.DisappearWhenAnimationOnceEnd) then
	self:GetSpriteEntity().Visible = false
	self.DisappearWhenAnimationOnceEnd = false
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
end