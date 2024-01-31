return function (self,componentType) 
if self.Enable == false then
	return
end

local colliderComponent = self.Entity:GetComponent(componentType)
if self:Init(colliderComponent) == false then
	log(tostring(componentType["UnderlyingSystemType"]).." is not valid")
end
end