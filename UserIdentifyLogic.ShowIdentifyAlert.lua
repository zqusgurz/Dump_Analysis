return function (self) 
_UtilDlgLogic.ModalMan:ShowFixedYesNoModal(
	_AppService:Get().ModalMan.UserIdentifyModalPool,
	nil,
	"model://c59892a6-3289-4e89-89f4-961664be430c", 
	function()
		_UtilDlgLogic:YesNo("로그인 화면에서\n본인확인 계정연동을 진행하시겠습니까?", function()
			_UserService.LocalPlayer.WsUserConsistencyComponent:Logout()
		end, nil)
	end,
	nil
)
end