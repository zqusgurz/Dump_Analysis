return function (self,b) 
self.State = b
self.Checkbox.Enable = b
self.Entity:SendEvent(CheckboxStateChangedEvent(b))
end