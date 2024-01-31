return function (self) 
local shipObj = self.Entity:GetChildByName("ShipObj")
if (isvalid(shipObj)) then
	self:RequestContiState()
end
end