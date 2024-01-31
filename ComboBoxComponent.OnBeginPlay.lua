return function (self) 
self.Button:ConnectEvent(ButtonClickEvent, self.OpenDropdown)
self:Refresh(false)
end