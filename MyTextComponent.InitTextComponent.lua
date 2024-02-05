return function (self) 
---@type TextComponent
local c = self.Entity:AddComponent(TextComponent)
self.TextComponent = c
local fontBase = _FontService.MSWFontBase[self.Font]
local baseSize = fontBase[1]
local fontType = fontBase[2]
local fontFace = fontBase[3]
c.FontSize = math.floor(baseSize * _ScreenResolutionLogic:GetScale().x)
c.UseNBSP = true
if (self.RichTextType == _RichTextType.Tooltip) then
	c.IsRichText = true
end
if (fontType == 1) then
	c.Bold = true
elseif (fontType == 2) then
	c.UseOutLine = true
	c.OutlineWidth = 1
	c.OutlineColor = Color.FromHexCode("#335588")
end
c.Text = ""
c.Font = fontFace
if (self.OverflowEllipsis) then
	c.Overflow = OverflowType.ellipsis
end
local textX = self.AlignmentX + self.TextAlignmentX
local textY = self.AlignmentY
if (textY == 0) then
	if (textX == 0) then
		c.Alignment = TextAlignmentType.UpperLeft
	elseif (textX == 0.5) then
		c.Alignment = TextAlignmentType.UpperCenter
	else
		c.Alignment = TextAlignmentType.UpperRight
	end
elseif (textY == 0.5) then
	if (textX == 0) then
		c.Alignment = TextAlignmentType.MiddleLeft
	elseif (textX == 0.5) then
		c.Alignment = TextAlignmentType.MiddleCenter
	else
		c.Alignment = TextAlignmentType.MiddleRight
	end
elseif (textY == 1) then
	if (textX == 0) then
		c.Alignment = TextAlignmentType.LowerLeft
	elseif (textX == 0.5) then
		c.Alignment = TextAlignmentType.LowerCenter
	else
		c.Alignment = TextAlignmentType.LowerRight
	end
end

local x = 0
local y = 0
if (self.AdjustLegacy) then
	x = 3
	y = 2
else
	x = -10
	y = 4
end
if (self.Font == "Tahoma14") then
	y -= 6
end
self.MSWFontOffset += Vector2(x, y)
end