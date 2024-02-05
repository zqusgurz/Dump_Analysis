return function (self,ratio,resetFlag) 
local round = _NumberUtils.Round
local function adjust(n)
	return n --round(nil, n * 100) / 100
end
local function adjustPos(n) 
	return n --round(nil, n * 100) / 100
end
local upscale = _Constants.GlobalUpscaleSize
local uitc = self.Entity.UITransformComponent
---@type AlignmentType
local alignmentOption = self.AlignmentOption

--if (alignmentOption == AlignmentType.HorizontalTop) then
--    offsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
--    offsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
--    offsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
--    offsetMin.y = adjust((self.OriginOffsetMax.y - self.OriginRectSize.y) * ratio.y * upscale.y)
--elseif (alignmentOption == AlignmentType.HorizontalCenter) then
--    offsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
--    offsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
--    offsetMax.y = adjust((self.OriginOffsetMin.y + self.OriginRectSize.y / 2) * ratio.y * upscale.y)
--    offsetMin.y = adjust((self.OriginOffsetMax.y - self.OriginRectSize.y / 2) * ratio.y * upscale.y)
--elseif (alignmentOption == AlignmentType.HorizontalBottom) then
--    offsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
--    offsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
--    offsetMax.y = adjust((self.OriginOffsetMin.y + self.OriginRectSize.y) * ratio.y * upscale.y)
--    offsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
--elseif (alignmentOption == AlignmentType.VerticalLeft) then
--    offsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
--    offsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
--    offsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
--    offsetMin.x = adjust((self.OriginOffsetMax.x - self.OriginRectSize.x) * ratio.x * upscale.x)
--elseif (alignmentOption == AlignmentType.VerticalRight) then
--    offsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
--    offsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
--    offsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
--    offsetMax.x = adjust((self.OriginOffsetMin.x + self.OriginRectSize.x) * ratio.x * upscale.x)
--elseif (alignmentOption == AlignmentType.VerticalCenter) then
--    offsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
--    offsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
--    offsetMax.x = adjust((self.OriginOffsetMin.x + self.OriginRectSize.x / 2) * ratio.x * upscale.x)
--    offsetMin.x = adjust((self.OriginOffsetMax.x - self.OriginRectSize.x / 2) * ratio.x * upscale.x)
--elseif (alignmentOption == AlignmentType.StretchAll) then
--    offsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
--    offsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
--    offsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
--    offsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
--else
--    anchoredPos.x = adjustPos(self.OriginAnchoredPosition.x * ratio.x)
--    anchoredPos.y = adjustPos(self.OriginAnchoredPosition.y * ratio.y)
--    rectSize.x = adjust(self.OriginRectSize.x * ratio.x * upscale.x)
--    rectSize.y = adjust(self.OriginRectSize.y * ratio.y * upscale.y)
--end

if (self.stretchHorizontal) then
    uitc.OffsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
    uitc.OffsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
    uitc.OffsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
    uitc.OffsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
else
	if ((resetFlag & 1) ~= 0) then
		local x = self.OriginAnchoredPosition.x
		if (_FontService.DisableCustomFont) then
			local txt = self.Entity.MyTextComponent
			if (isvalid(txt)) then
				x += txt.MSWFontOffset.x
				x += txt.MSWFontOffset_ByCode.x
			end
		end
    	uitc.anchoredPosition.x = adjustPos(x * ratio.x)
	end
	if ((resetFlag & 2) ~= 0) then
    	uitc.RectSize.x = adjust(self.OriginRectSize.x * ratio.x * upscale.x)
	end
end

if (self.stretchVertical) then
    uitc.OffsetMax.x = adjust(self.OriginOffsetMax.x * ratio.x * upscale.x)
    uitc.OffsetMin.x = adjust(self.OriginOffsetMin.x * ratio.x * upscale.x)
    uitc.OffsetMax.y = adjust(self.OriginOffsetMax.y * ratio.y * upscale.y)
    uitc.OffsetMin.y = adjust(self.OriginOffsetMin.y * ratio.y * upscale.y)
else
	if ((resetFlag & 1) ~= 0) then
		local y = self.OriginAnchoredPosition.y
		if (_FontService.DisableCustomFont) then
			local txt = self.Entity.MyTextComponent
			if (isvalid(txt)) then
				y += txt.MSWFontOffset.y
				y += txt.MSWFontOffset_ByCode.y
			end
		end
    	uitc.anchoredPosition.y = adjustPos(y * ratio.y)
	end
	if ((resetFlag & 2) ~= 0) then
    	uitc.RectSize.y = adjust(self.OriginRectSize.y * ratio.y * upscale.y)
	end
end

local sl = self.Entity.ScrollLayoutGroupComponent
if (isvalid(sl)) then
	sl.Padding.left = adjust(self.ScrollLayoutPaddingLb.x * ratio.x)
	sl.Padding.right = adjust(self.ScrollLayoutPaddingRt.x * ratio.x)
	sl.Padding.top = adjust(self.ScrollLayoutPaddingRt.y * ratio.y)
	sl.Padding.bottom = adjust(self.ScrollLayoutPaddingLb.y * ratio.y)
	sl.CellSize = self.ScrollLayoutCellSize * ratio
	sl.CellSize.x = sl.CellSize.x * upscale.x
	sl.CellSize.y = sl.CellSize.y * upscale.y
	if (sl.Type == LayoutGroupType.Horizontal) then
		sl.Spacing = adjust(self.ScrollLayoutSpacing * ratio.x)
	elseif (sl.Type == LayoutGroupType.Vertical) then
		sl.Spacing = adjust(self.ScrollLayoutSpacing * ratio.y)
	else
		sl.GridSpacing = self.ScrollLayoutGridSpacing * ratio
	end
end
end