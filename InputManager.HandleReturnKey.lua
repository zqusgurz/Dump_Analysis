return function (self) 
local now = _UtilLogic.ElapsedSeconds
if (now - self.LastSubmittedTextInput < 0.2) then
	return
end
--log("HandleReturnKey")

local app = _AppService:Get()
local handledByModal = app.ModalMan:HandleEscOrReturnKey(false)
if (handledByModal) then
	return
end
local handledByOption = app.OptionMan:OnReturnKey()
if (handledByOption) then
	return
end
--log("HandleReturnKey1")
local handledByCtrlWnd = app.ControlWindowMan:OnReturnKey()
if (handledByCtrlWnd) then
	return
end
-- log("HandleReturnKey2: ", app.ChatSystem.TypingTime)
if (not _UtilDlgLogic:IsActiveModal()) then
	if (not _UserService.LocalPlayer.WsUser:IsOnJob()) then
		if (app.ChatSystem.TypingTime < now) then
			app.ChatSystem:FocusChatInput("")
		end
	end
end
end