return function (self) 
local fh = self:GetCurrentFoothold()
local a = self.Entity.AnimatedObjectComponent
if (fh ~= nil and isvalid(a)) then
	a:UpdateLayerFromFoothold(fh.Id, fh.OwnerId)
end
end