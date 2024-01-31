return function (self,collider,gizmoObject) 
local size, colliderType, offset, radius, polygonPoints

if collider.IsLegacy == true then
	colliderType = ColliderType.Box
	size = collider.BoxSize
	offset = collider.BoxOffset
else	
	colliderType = collider.ColliderType
	offset = collider.ColliderOffset
	if collider.ColliderType ==  ColliderType.Box then
		size = collider.BoxSize;
	elseif collider.ColliderType ==  ColliderType.Circle then
		radius = collider.CircleRadius;	
	elseif collider.ColliderType ==  ColliderType.Polygon then
		polygonPoints = collider.PolygonPoints	
	end
end

-- draw line
if colliderType == ColliderType.Box then
	self.Entity.ColliderVisualizer:DrawBox(size, offset, self.LineColor, self.LineWidth, gizmoObject)
elseif colliderType == ColliderType.Circle then
	self.Entity.ColliderVisualizer:DrawCircle(radius, offset, 20, self.LineColor, self.LineWidth, gizmoObject)
elseif colliderType == ColliderType.Polygon then
	self.Entity.ColliderVisualizer:DrawPolygon(polygonPoints, offset, self.LineColor, self.LineWidth, gizmoObject)
end
end