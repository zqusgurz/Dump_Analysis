return function (self) 
self.OkButton:ConnectEvent(ButtonClickEvent, self.OnOkButton)
self.CancelButton:ConnectEvent(ButtonClickEvent, self.OnCancelButton)
end