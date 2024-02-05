return function (self,val) 
local num = math.tointeger(tonumber(val))
if (num == nil or num < 10) then
	_UtilDlgLogic:Show("10 이상의 숫자만 가능합니다.")
	return
end
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local maxMoney = math.min(cd.Money, 50000)
if (num > maxMoney) then
	_UtilDlgLogic:Show(maxMoney .. " 이하의 숫자만 가능합니다.")
	return
end
user.WsUser.ExclusiveAction = true
_InventoryLogic:TryDropMoney(user, num)
end