return function (self,event) 
local TouchId = event.TouchId
local TouchPoint = event.TouchPoint

if (_InputUtils:IsPrimaryButton(TouchId)) then
	if (_InputService:IsPointerOverUI()) then
		return
	end
	if (_UtilLogic.ElapsedSeconds - self._T.Clicked < 0.6) then
		local player = self.Entity.Parent.PetComponent.Owner
		_UpdateComponentLogic:RegisterDoubleClickedContext(player, 1)
		self._T.Clicked = 0
	else
		self._T.Clicked = _UtilLogic.ElapsedSeconds
	end
end
end