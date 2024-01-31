return function (self,collider) 
if collider == nil then
	return false
end

if collider.EnableInHierarchy == false then
	return false
end

local path = self.Entity.Path.."/"..collider.ColliderName
local gizmoObject = _EntityService:GetEntityByPath(path)
if gizmoObject == nil then
	return false
end

self:OnDraw(collider, gizmoObject)
return true
end