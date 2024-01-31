return function (self) 
if (_DebugConstants:IsMobile()) then
	return self._statusBarMobile
else
	return self._statusBar
end
end