return function (self,worldPos,canvasSize,origin) 
local mapleBase = Vector3(canvasSize.x / 2, -canvasSize.y / 2, 0)
local mswOriginOffset = Vector3(-origin.x, origin.y, 0)
local relPos = ((mapleBase + mswOriginOffset) / 100)
worldPos = worldPos + relPos
return worldPos

--local offset = Vector3((canvasSize.x / 2) - origin.x, (-canvasSize.y / 2) + origin.y, 0)
--worldPos = worldPos + (offset/ 100)
--return worldPos
end