return function (self,event) 
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint

--log("Player touched! touchid:" .. TouchId .. " / pos: " .. string.format("%.2f, %.2f", TouchPoint.x, TouchPoint.y))
if (_InputUtils:IsPrimaryButton(TouchId)) then
	if (_InputService:IsPointerOverUI()) then
		return
	end
	if (_UtilLogic.ElapsedSeconds - self._T.Clicked < 0.6) then
		_UpdateComponentLogic:RegisterDoubleClickedContext(self.Entity, 0)
		self._T.Clicked = 0
	else
		self._T.Clicked = _UtilLogic.ElapsedSeconds
	end
end
end