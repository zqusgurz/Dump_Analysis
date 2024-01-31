return function (self) 
self.btnOk.Entity:DisconnectEvent(ButtonClickEvent,self.okHandler)
self.btnCancel.Entity:DisconnectEvent(ButtonClickEvent,self.cancelHandler)
self:StartTween(false)
end