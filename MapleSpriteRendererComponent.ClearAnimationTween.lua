return function (self) 
if (self._tween ~= 0) then
	--log("cleared tween")
	_TimerService:ClearTimer(self._tween)
	self._tween = 0
end
end