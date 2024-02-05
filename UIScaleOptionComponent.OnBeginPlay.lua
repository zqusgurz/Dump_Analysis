return function (self) 
self.Slider.Entity:ConnectEvent(SliderValueChangedEvent, function(event)
	self.RatioText.Text = string.format("%dx", event.Value)
end)
end