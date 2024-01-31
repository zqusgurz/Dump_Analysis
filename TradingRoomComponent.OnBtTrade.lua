return function (self) 
_UtilDlgLogic:YesNo("정말로 교환하시겠습니까?", function()
	_TradingRoomLogic:SetLock(_UserService.LocalPlayer)
end, nil)
end