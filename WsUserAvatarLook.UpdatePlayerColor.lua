return function (self,isLocal) 
local user = self.Entity
local t = self._T
local hit = user.PlayerHitComponent
if (isLocal and hit.HitTime > _UtilLogic.ServerElapsedSeconds and hit.HitDamage > 0) then
	local i = t.HitFlashingIndex
	if ((i & 3) < 2) then
		self.CurrentAvatarColor = Color(0.5, 0.5, 0.5, 1)
	else
		self.CurrentAvatarColor = Color.white
	end
	t.HitFlashingIndex += 1
elseif (user.PlayerTemporaryStat:GetValue(_CTS.DarkSight) > 0) then
	self.CurrentAvatarColor = Color(1, 1, 1, 0.5)
else
	self.CurrentAvatarColor = Color.white
end

if (self.CurrentAvatarColor ~= t.LastAvatarColor) then
	local c = self.CurrentAvatarColor
	user.AvatarRendererComponent:SetColor(c.r, c.g, c.b, c.a)
end

t.LastAvatarColor = self.CurrentAvatarColor
end