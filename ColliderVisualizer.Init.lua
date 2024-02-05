return function (self,collider) 
if collider == nil then 
	return false
end

if collider.EnableInHierarchy == false then
	return false
end

local gizmoObject =_SpawnService:SpawnByModelId("model://transformonly", collider.ColliderName, Vector3.zero, self.Entity)
if gizmoObject.LineRendererComponent == nil then
	gizmoObject:AddComponent(LineRendererComponent)
end

self:OnDraw(collider, gizmoObject)
return true
end