return function (self,boxId,b) 
---@type BoxShape
local box = b

if (self._T.Boxes == nil) then
	self._T.Boxes = {}
end
---@type Entity
local boxEntity = self._T.Boxes[boxId]
if (not isvalid(boxEntity)) then
	boxEntity = _SpawnService:SpawnByModelId("model://transformonly", "BoxLine"..boxId, Vector3.zero, self.Entity.CurrentMap)
	boxEntity:AddComponent(LineRendererComponent)
	self._T.Boxes[boxId] = boxEntity
end

local lineRenderer = boxEntity.LineRendererComponent
lineRenderer.Points:Clear()
lineRenderer.Loop = true

local halfSize = box.Size / 2
local offset = box.Position
local color = Color(1,1,0,1)
local width = 0.1

lineRenderer.Points:Add(LinePoint(Vector2(-halfSize.x, halfSize.y) + offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(halfSize.x, halfSize.y)+ offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(halfSize.x, -halfSize.y)+ offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(-halfSize.x, -halfSize.y)+ offset,color,width))
end