return function (self,obj,map) 
local canv = map.MinimapInfoComponent
if not(isvalid(map.MinimapInfoComponent)) then
	canv = map:AddComponent(MinimapInfoComponent)
end

---@type WzObject
local minimap = obj.Children["miniMap"]

local canvas = minimap.Children["canvas"]
canv.Canvas = canvas.String
canv.CanvasSize = canvas.Vector

canv.CenterX = minimap:GetInt32("centerX", 0)
canv.CenterY = minimap:GetInt32("centerY", 0)
canv.Width = minimap:GetInt32("width", 0)
canv.Height = minimap:GetInt32("height", 0)
canv.Mag = minimap:GetInt32("mag", 0)
end