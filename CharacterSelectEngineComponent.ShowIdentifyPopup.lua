return function (self,image,okButton) 
local popup = self.IdentifyPopup.IdentifyPopupWindowComponent
popup:ChangeBackByRUID(image)
popup.BtOk.Enable = okButton
popup.BtCancel.Enable = not okButton
popup.BtYes1.Enable = false
popup.BtNo1.Enable = false
popup.TimeoutIcon.Enable = false
self.IdentifyPopupCallbackYes = nil
self.IdentifyPopupCallbackNo = nil
popup:Show("")
end