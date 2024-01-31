return function (self) 
local mmi = self.MiniMapInfo
if not (isvalid(mmi)) then
	return
end
local lp = _UserService.LocalPlayer
local canvasSize = self.MiniMapCanvasSize
local fullSize = mmi.CanvasSize
local horizontalMax = math.abs((fullSize.x - canvasSize.x) / 2)
local verticalMax = math.abs((fullSize.y - canvasSize.y) / 2)
local center = fullSize / 2
local userPos = lp.TransformComponent.WorldPosition:ToVector2()
local miniMapPos = mmi:TransformPosition(userPos)

local posFromCenter = miniMapPos - Vector2(center.x, -center.y)
local horizontalScroll = -posFromCenter.x
if (horizontalScroll < -horizontalMax) then
	horizontalScroll = -horizontalMax
elseif (horizontalScroll > horizontalMax) then
	horizontalScroll = horizontalMax
end

local verticalScroll = -posFromCenter.y
if (verticalScroll < -verticalMax) then
	verticalScroll = -verticalMax
elseif (verticalScroll > verticalMax) then
	verticalScroll = verticalMax
end

local ratio = 2 --_ScreenResolutionLogic:GetScale()
self.MiniMapCanvas.Entity.UITransformComponent.anchoredPosition = Vector2(horizontalScroll, verticalScroll) * ratio
end