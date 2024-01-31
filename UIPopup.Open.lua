return function (self,message,onOk,onCancel) 
if self.isOpen == true then
	return
end
self.isOpen = true
self.popupGroup.Enable = true
self.message.Text = message
self.onOk = onOk
self.onCancel = onCancel


self.okHandler = self.btnOk.Entity:ConnectEvent(ButtonClickEvent,self.OnClickOk)
self.cancelHandler = self.btnCancel.Entity:ConnectEvent(ButtonClickEvent,self.OnClickCancel)
self:StartTween(true)
end