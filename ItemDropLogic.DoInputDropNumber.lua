return function (self,item,ditem,text) 
local decimal = tonumber(text)
local dd, ff = math.modf(decimal)
if (ff ~= 0) then
	_UtilDlgLogic:Show("잘못된 숫자 입력입니다.")
	return
end
if (dd <= 0 or dd > item.Number) then
	_UtilDlgLogic:Show(string.format("1부터 %d까지만 입력할 수 있습니다.", item.Number))
	return
end
local cd = _UserService.LocalPlayer.WsCharacterData
cd.Entity.WsUser.ExclusiveAction = true
_InventoryLogic:TryDropItem(cd, ditem.LinkedTI, ditem.LinkedPos, dd)
end