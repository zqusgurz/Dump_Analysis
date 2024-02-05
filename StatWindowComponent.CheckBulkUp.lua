return function (self,stat,statKey) 
local ap = _UserService.LocalPlayer.WsCharacterData.Ap
_UtilDlgLogic:Input(string.format("%s(%s) 스탯에 AP를 얼마나 투자하시겠습니까?", stat, statKey), true, tostring(ap), function(v)
	local k = tonumber(math.floor(v))
	ap = _UserService.LocalPlayer.WsCharacterData.Ap
	if (k <= 0) then
		_UtilDlgLogic:Show("1 이상만 입력할 수 있습니다.")
		return true
	elseif (k > ap) then
		_UtilDlgLogic:Show(string.format("%d 이하만 입력할 수 있습니다.", ap))
		return true
	end
	_UtilDlgLogic:YesNo(string.format("정말 %s(%s) 스탯에 AP를 %d 만큼 투자하시겠습니까?", stat, statKey, k), function()
		if (statKey == "STR") then
			_PlayerStatLogic:OnDistributeApBulk(_UserService.LocalPlayer, k, 0, 0, 0)
		elseif (statKey == "DEX") then
			_PlayerStatLogic:OnDistributeApBulk(_UserService.LocalPlayer, 0, k, 0, 0)
		elseif (statKey == "INT") then
			_PlayerStatLogic:OnDistributeApBulk(_UserService.LocalPlayer, 0, 0, k, 0)
		elseif (statKey == "LUK") then
			_PlayerStatLogic:OnDistributeApBulk(_UserService.LocalPlayer, 0, 0, 0, k)
		end
	end, nil)
end, nil)
end