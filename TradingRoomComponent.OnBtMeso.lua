return function (self) 
if (self.OtherPlayer == nil) then
	return
end
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData
local money = cd.Money - cd.TradingMoney
_UtilDlgLogic:Input("얼마를 올리시겠습니까?", true, "1", function(val)
	local num = math.tointeger(tonumber(val))
	if (num == nil or num <= 0) then
		_UtilDlgLogic:Show("1 이상의 숫자만 가능합니다.")
		return true
	end
	if (num > money) then
		_UtilDlgLogic:Show(string.format("%d 이하의 숫자만 가능합니다", money))
		return true
	end
	player.WsUser.ExclusiveAction = true
	_TradingRoomLogic:PutMoney(player, num)
end, nil)
end