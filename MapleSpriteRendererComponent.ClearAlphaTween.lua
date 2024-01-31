return function (self,anim) 
if (self._T.AlphaTween ~= nil) then
	self._T.AlphaTween:Destroy()
	self._T.AlphaTween = nil
end
if (self._T.LastAlpha == nil) then
	self._T.LastAlpha = anim.A0
end
end