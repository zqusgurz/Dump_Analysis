return function (self,list) 
for i=1,#list do
	local itemId = list[i][1]
	local quantity = list[i][2]
	local itemName = _StringMan:GetItemName(itemId)
	if (quantity < 0) then
		if (quantity == -1) then
			_ChatMessageLogic:Add(_ChatMessageType.System, string.format("아이템을 잃었습니다 (%s)", itemName))
		else
			_ChatMessageLogic:Add(_ChatMessageType.System, string.format("아이템을 잃었습니다 (%s %d개)", itemName, -quantity))
		end
	elseif (quantity > 0) then
		local itemType = _Items:GetItemTypeName(itemId // 1000000)
		if (quantity == 1) then
			_ChatMessageLogic:Add(_ChatMessageType.System, string.format("%s 아이템을 얻었습니다 (%s)", itemType, itemName))
		else
			_ChatMessageLogic:Add(_ChatMessageType.System, string.format("%s 아이템을 얻었습니다 (%s %d개)", itemType, itemName, quantity))
		end
	end
end
end