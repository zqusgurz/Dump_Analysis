return function (self,polygon,offset,color,width,gizmoObject) 
-- polygon: 다각형들의 점(table<vactor2>)
-- offset: 상대위치
-- color: 선 색상
-- width: 선 두께
-- gizmoObject: 기즈모 객체

local lineRenderer = gizmoObject.LineRendererComponent
lineRenderer.Points:Clear()
lineRenderer.Loop = true

for i, j in ipairs(polygon) do
	local position = j + offset
	local point = LinePoint(position, color, width)	 
	lineRenderer.Points:Add(point)
end
end