return function (self) 
self.Checkbox.Entity:ConnectEvent(CheckboxStateChangedEvent, function(event)
	if (event.State) then
		self.StateText.Text = "켜기"
	else
		self.StateText.Text = "끄기"
	end
end)
end