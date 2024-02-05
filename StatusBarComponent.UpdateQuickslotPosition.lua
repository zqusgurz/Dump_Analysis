return function (self) 
if (not self.Quickslot) then
	return
end
local uiScale = _Constants.GlobalScale * _ScreenResolutionLogic.UIScaleSize
local screenWidth = _UILogic.ScreenWidth
local messages = _AppService:Get().ScreenMsgMan.Messages
if (screenWidth < uiScale.x * (800 + 151)) then
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Quickslot, nil, -1 + 68)
	if (messages) then
		_EntityUtils:SetPositionUIEntitySafelyEx(messages, nil, 94 + 68)	
	end
	self.IsQuickslotUpper = true
else
	self.Quickslot.Enable = true
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Quickslot, nil, -1)
	self.IsQuickslotUpper = false
	if (messages) then
		_EntityUtils:SetPositionUIEntitySafelyEx(messages, nil, 94)
	end
end
end