return function (self,radius,offset,vertexNum,color,width,gizmoObject) 
-- radius: 반지름
-- offset: 상대위치
-- vertexNum: 꼭지점 수
-- color: 선 색상
-- width: 선 두께
-- gizmoObject: 기즈모 객체

if vertexNum < 3 then
	log_error ("The \'vertexNum\' should be greater than or equal to 3.")
	return
end
	 
local lineRenderer = gizmoObject.LineRendererComponent
lineRenderer.Points:Clear()
lineRenderer.Loop = true
	 
local delta = 360 / vertexNum
	 
for i = 0, vertexNum - 1 do
	local theta = math.rad(90 + delta * i)
	local position = Vector2(math.cos(theta), math.sin(theta)) * radius + offset
 
	local point = LinePoint(position, color, width)	 
	lineRenderer.Points:Add(point)
end
end