return function (self) 
if (self.ModalType == _ModalType.GenericInput) then
	if (not self.Entity.Enable) then
		return true
	end
	if (self.callback == nil or not self.callback(0, self.TextInput.Text)) then
		local m = self.Entity.Parent.ModalManComponent
		m:Release(self.ReleasePool, self.Entity)
		return true
	end
end
return false
end