return function (self,size,offset,color,width,gizmoObject) 
-- size: 박스크기
-- offset: 상대위치
-- color: 선 색상
-- width: 선 두께
-- gizmoObject: 기즈모 객체

local lineRenderer = gizmoObject.LineRendererComponent
lineRenderer.Points:Clear()
lineRenderer.Loop = true

local vertexNum = 4

local radian = math.rad(self.Entity.TransformComponent.ZRotation)
local halfSize = size / 2
lineRenderer.Points:Add(LinePoint(Vector2(-halfSize.x, halfSize.y) + offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(halfSize.x, halfSize.y)+ offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(halfSize.x, -halfSize.y)+ offset,color,width))
lineRenderer.Points:Add(LinePoint(Vector2(-halfSize.x, -halfSize.y)+ offset,color,width))
end