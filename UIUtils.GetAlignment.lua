return function (self,entity) 
local u = entity.UITransformComponent
if (u.AlignmentOption == AlignmentType.BottomLeft) then
	return Vector2(-1,-1)
elseif (u.AlignmentOption == AlignmentType.TopLeft) then
	return Vector2(-1,1)
elseif (u.AlignmentOption == AlignmentType.TopRight) then
	return Vector2(1,1)
elseif (u.AlignmentOption == AlignmentType.BottomRight) then
	return Vector2(1,-1)
end
end