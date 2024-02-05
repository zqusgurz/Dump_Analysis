return function (self,componentType,enabled) 
---@type any
local collider = self.Entity:GetComponent(componentType)
local path = self.Entity.Path.."/"..collider.ColliderName
local gizmoObject = _EntityService:GetEntityByPath(path)
if gizmoObject ~= nil then
	gizmoObject.Enable = enabled
end
end