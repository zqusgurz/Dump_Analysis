return function (self,cd,questId) 
---@type QuestAct
local startAct = _QuestMan.StartAct[questId]
---@type table<QuestActItem>
local items = startAct.Item
local itemsNum = #items
if (itemsNum > 0) then
	local found = false
	for i=1,itemsNum do
		local item = items[i]
		if (item.Count > 0) then
			local num = _InventoryLogic:GetItemCount(cd, item.ItemId)
			if (_InventoryLogic:IsEquipping(cd, item.ItemId)) then
				num -= 1
			end
			if (num >= item.Count) then
				return false
			end
			found = true
		end
	end
	return true
end
return false
end