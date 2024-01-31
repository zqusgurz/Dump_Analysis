return function (self,e,delta) 
local currentPos = e.UITransformComponent.anchoredPosition

local mi = e.MemoryInitValuesComponent
if (not isvalid(mi)) then
    self:CheckUIMemory(e, false, -1)
    mi = e.MemoryInitValuesComponent
end
if (isvalid(mi)) then
	local newRealPos = mi.OriginAnchoredPosition + delta
	mi.OriginAnchoredPosition = newRealPos
end

local newScaledPos = currentPos + delta * _ControlWindowLogic.UIRatio
e.UITransformComponent.anchoredPosition = newScaledPos
end