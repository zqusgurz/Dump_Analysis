return function (self) 
self.PetMovableState = {
	["IDLE"] = true,
	["MOVE"] = true,
	["ACTION"] = true
}
if (self:IsServer()) then
	self:Load()
	self:LoadServer()
end
end