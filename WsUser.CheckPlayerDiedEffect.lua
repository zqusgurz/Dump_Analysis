return function (self) 
local value = self.Hp
if (value == 0 and not self.DiedState) then
	self:OnDied()
	self:SetDead(true)
elseif (value > 0 and self.DiedState) then
	self:OnRespawn()
	self:SetDead(false)
end
end