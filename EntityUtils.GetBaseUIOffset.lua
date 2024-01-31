return function (self,entity,relativePosition) 
-- UI 엔티티의 기반 위치를 구해옴.
-- 0,0이면 좌상단, 0.5,0.5면 중앙, 1,1이면 우하단 첫 픽셀 좌표

local entitySize = entity.UITransformComponent.RectSize
local entityAnchoredPosition = entity.UITransformComponent.anchoredPosition
local entityPivot = entity.UITransformComponent.Pivot
local anchorMin = entity.UITransformComponent.AnchorsMin -- 왼쪽 하단
local anchorMax = entity.UITransformComponent.AnchorsMax -- 오른쪽 상단
local offsetMin = entity.UITransformComponent.OffsetMin -- 왼쪽 하단 기준 오른쪽 상단의 편차
local offsetMax = entity.UITransformComponent.OffsetMax -- 오른쪽 상단 기준 오른쪽 상단의 편차

return Vector2.zero
end