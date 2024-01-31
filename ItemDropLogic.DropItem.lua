return function (self,item,ditem) 
local cd = _UserService.LocalPlayer.WsCharacterData
if (_Items:IsTreatSingly(ditem.ItemId)) then
	cd.Entity.WsUser.ExclusiveAction = true
	_InventoryLogic:TryDropItem(cd, ditem.LinkedTI, ditem.LinkedPos, 0)
else
	if (item.Number == 1) then
		cd.Entity.WsUser.ExclusiveAction = true
		_InventoryLogic:TryDropItem(cd, ditem.LinkedTI, ditem.LinkedPos, 1)
	else
		_UtilDlgLogic:Input("몇 개나 버리시겠습니까?", true, tostring(item.Number), function(txt)
			self:DoInputDropNumber(item, ditem, txt)
		end, nil)
	end
end
end