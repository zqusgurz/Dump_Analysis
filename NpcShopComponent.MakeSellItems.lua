return function (self,TI) 
local sellItems = {}
local cd = _UserService.LocalPlayer.WsCharacterData

for i=1,cd.ItemMaxSlot[TI] do
	local item = cd:GetItem(TI, i)
	if (not self:IsSellableItem(item)) then
		continue
	end
	sellItems[#sellItems + 1] = {TI=TI, Pos=i, ItemId=item.ItemId}
end

return sellItems
end