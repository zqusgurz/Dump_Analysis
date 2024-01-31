return function (self) 
self.Entity:ConnectEvent(ButtonClickEvent, function()
	local target = self.TargetWindow
	if (isvalid(target)) then
		target.Enable = true
		local optionWindow = target.OptionWindowComponent
		if (isvalid(optionWindow)) then
			optionWindow:OnVisible()
		end
	end
end)
end