return function (self) 
if (self.ModalType == _ModalType.FixedYesNo or 
	self.ModalType == _ModalType.GenericYesNo or
	self.ModalType == _ModalType.Generic) then
	if (self.callback == nil or not self.callback(1)) then
		local m = self.Entity.Parent.ModalManComponent
		m:Release(self.ReleasePool, self.Entity)
		return true
	end
end
return false
end