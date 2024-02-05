return function (self) 
if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
	return
end
_AppService:Get():CloseMenus()
_UtilDlgLogic:YesNo("로그인 화면으로 돌아가시겠습니까?", function()
	_UserService.LocalPlayer.WsUserConsistencyComponent:Logout()
end, nil)
end