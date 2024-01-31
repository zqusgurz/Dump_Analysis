return function (self,lineId,startPos,endPt,color) 
if (self._T.Lines == nil) then
	self._T.Lines = {}
end
---@type Entity
local lineEntity = self._T.Lines[lineId]
if (not isvalid(lineEntity)) then
	lineEntity = _SpawnService:SpawnByModelId("model://transformonly", "Line"..lineId, Vector3.zero, self.Entity.CurrentMap)
	lineEntity:AddComponent(LineRendererComponent)
	self._T.Lines[lineId] = lineEntity
end

local lineRenderer = lineEntity.LineRendererComponent
lineRenderer.Points:Clear()

local width = 0.2
--log(startPos, endPt, color, width)
lineRenderer.Points:Add(LinePoint(startPos,color,width))
lineRenderer.Points:Add(LinePoint(endPt,color,width))
end