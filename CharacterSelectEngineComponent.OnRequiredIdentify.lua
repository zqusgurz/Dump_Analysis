return function (self) 
self:ShowIdentifyPopUpYesNo(_UidMan:GetRawRUID("6e63b0b741b14a5fabcde14db6caa35e"), function()
	self:RequestIdentify(_UserService.LocalPlayer, false)
	return true
end, nil)
end