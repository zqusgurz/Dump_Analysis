return function (self,entity,alignment) 
local current = self:GetAlignment(entity)
local u = entity.UITransformComponent
if (alignment.x == -1) then
	u.OffsetMin.x = 0
	u.OffsetMax.x = u.RectSize.x 
	u.AnchorsMin.x = 0
	u.AnchorsMax.x = 0
	u.Pivot.x = 0
elseif (alignment.x == 1) then
	u.OffsetMin.x = -u.RectSize.x
	u.OffsetMax.x = 0
	u.AnchorsMin.x = 1
	u.AnchorsMax.x = 1
	u.Pivot.x = 1
end
if (alignment.y == -1) then
	u.OffsetMin.y = 0
	u.OffsetMax.y = u.RectSize.y
	u.AnchorsMin.y = 0
	u.AnchorsMax.y = 0
	u.Pivot.y = 1
elseif (alignment.y == 1) then
	u.OffsetMin.y = -u.RectSize.x
	u.OffsetMax.y = 0
	u.AnchorsMin.y = 1
	u.AnchorsMax.y = 1
	u.Pivot.y = 0
end

if (alignment.x == 0) then
	alignment.x = current.x
end
if (alignment.y == 0) then
	alignment.y = current.y
end

if (alignment.x == -1 and alignment.y == -1) then
	u.AlignmentOption = AlignmentType.BottomLeft
elseif (alignment.x == -1 and alignment.y == 1) then
	u.AlignmentOption = AlignmentType.TopLeft
elseif (alignment.x == 1 and alignment.y == 1) then
	u.AlignmentOption = AlignmentType.TopRight
elseif (alignment.x == 1 and alignment.y == -1) then
	u.AlignmentOption = AlignmentType.BottomRight
end
end