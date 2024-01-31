return function (self,event) 
if (_InputUtils:IsPrimaryButton(event.TouchId)) then
	if (_InputService:IsPointerOverUI()) then
		return
	end
	local now = _UtilLogic.ElapsedSeconds
	if (self._T.Clicked == nil or now - self._T.Clicked >= 1) then
		self._T.Clicked = now
		_UpdateComponentLogic:RegisterClickedContext(self.Entity, 0)
	end
end
end