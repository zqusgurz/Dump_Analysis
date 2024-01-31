return function (self,image,callbackYes,callbackNo) 
local popup = self.IdentifyPopup.IdentifyPopupWindowComponent
popup:ChangeBackByRUID(image)
popup.BtOk.Enable = false
popup.BtCancel.Enable = false
popup.BtYes1.Enable = true
popup.BtNo1.Enable = true
popup.TimeoutIcon.Enable = false
self.IdentifyPopupCallbackYes = callbackYes
self.IdentifyPopupCallbackNo = callbackNo
popup:Show("")
end