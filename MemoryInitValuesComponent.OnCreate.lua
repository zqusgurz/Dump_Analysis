return function (self) 
local uiComp = self.Entity.UITransformComponent
self.OriginAnchoredPosition = uiComp.anchoredPosition:Clone()
self.OriginRectSize = uiComp.RectSize:Clone()
self.OriginOffsetMin = uiComp.OffsetMin:Clone()
self.OriginOffsetMax = uiComp.OffsetMax:Clone()

local sl = self.Entity.ScrollLayoutGroupComponent
if (isvalid(sl)) then
	self.ScrollLayoutPaddingLb = Vector2(sl.Padding.left, sl.Padding.bottom)
	self.ScrollLayoutPaddingRt = Vector2(sl.Padding.right, sl.Padding.top)
	self.ScrollLayoutCellSize = sl.CellSize:Clone()
	self.ScrollLayoutGridSpacing = sl.GridSpacing:Clone()
	self.ScrollLayoutSpacing = sl.Spacing
end

local alignmentOpt = uiComp.AlignmentOption
self.AlignmentOption = alignmentOpt

if (alignmentOpt ~= AlignmentType.StretchAll and
    alignmentOpt ~= AlignmentType.HorizontalTop and
    alignmentOpt ~= AlignmentType.HorizontalCenter and
    alignmentOpt ~= AlignmentType.HorizontalBottom) then
    self.stretchHorizontal = false
else
    self.stretchHorizontal = true
end

if (alignmentOpt ~= AlignmentType.StretchAll and
    alignmentOpt ~= AlignmentType.VerticalLeft and
    alignmentOpt ~= AlignmentType.VerticalCenter and
    alignmentOpt ~= AlignmentType.VerticalRight) then
    self.stretchVertical = false
else
    self.stretchVertical = true
end
end