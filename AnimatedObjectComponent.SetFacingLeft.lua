return function (self,b) 
--log(string.format("SetFacingLeft to %d", b and -1 or 1))
local msp = self.Entity.MapleSpriteRendererComponent
if (isvalid(msp)) then
	msp:SetFacingLeft(b)
end
end