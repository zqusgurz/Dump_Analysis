return function (self,localUser,map) 
local hiddenUI = self:IsHiddenUI(localUser)

--[[
  0: Field
  1: Login
  2: ...
]]

--log("[FIELDATTR] Current field mode:", mode)

local localp = _UserService.LocalPlayer
local isLocal = localp == nil or localp.OwnerId == localUser.OwnerId

if (not hiddenUI) then -- Field
	if (isLocal) then
		_AppService:Get().ControlWindowMan.Entity.Enable = true
		_AppService:Get():GetStatusBar().Entity.Enable = true
		_AppService:Get().MobileUIGroup.Enable = true
		_AppService:Get().ChatSystem.Entity.Enable = true
		self.SettingButton.Enable = true
		localUser.WsUserController.Enable = true
		localUser.RigidbodyComponent.Enable = true
		localUser.MovementComponent.Enable = true
		localUser.ChatBalloonComponent.Message = ""
	end
	localUser.AvatarRendererComponent.Enable = true
	localUser.NameTagComponent.Enable = true
	localUser.TouchReceiveComponent.Enable = true
else -- Login
	if (isLocal) then
		_AppService:Get().ControlWindowMan.Entity.Enable = false
		_AppService:Get():GetStatusBar().Entity.Enable = false
		_AppService:Get().MobileUIGroup.Enable = false
		_AppService:Get().ChatSystem.Entity.Enable = false
		self.SettingButton.Enable = false
		localUser.WsUserController.Enable = false
		localUser.RigidbodyComponent.Enable = false
		localUser.MovementComponent.Enable = false
		self.OptionWindow.OptionWindowComponent:OnCancelButton()
		localUser.ChatBalloonComponent.Message = ""
	end
	localUser.AvatarRendererComponent.Enable = false
	localUser.NameTagComponent.Enable = false
	localUser.TouchReceiveComponent.Enable = false
end
end