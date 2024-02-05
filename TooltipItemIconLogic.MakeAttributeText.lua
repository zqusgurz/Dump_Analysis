return function (self,item) 
local attributeTexts = {}
local attributes = _Items:MakeAttributeTexts(item)
if (#attributes > 0) then
	attributeTexts[#attributeTexts + 1] = "#c" .. table.concat(attributes, ", ") .. "#"
end
local period = item["Period"]
local tooltipDeadTime = item["TooltipDeadTime"]
if (period) then
	local ps = string.format("%d일 동안 사용 가능", period)
	attributeTexts[#attributeTexts + 1] = ps
elseif (tooltipDeadTime) then
	local info = _ItemInfoMan:GetItem(item.ItemId)
	local ps = string.format("마법의 시간: %d일", info.i_life)
	attributeTexts[#attributeTexts + 1] = ps
else
	if (_Items:IsPet(item.ItemId)) then
		---@type ItemSlotPet
		local pet = item
		local deadTime = DateTime(pet.DeadTime)
		if (deadTime > DateTime.UtcNow) then
			local date = _UtilLogic:GetLocalTimeFrom(deadTime)
			local pattern = "마법의 시간: %04d년 %d월 %d일 %02d시까지"
			attributeTexts[#attributeTexts + 1] = string.format(pattern,
				date.Year, date.Month, date.Day, date.Hour, date.Minute)
		else
			attributeTexts[#attributeTexts + 1] = "마법의 시간이 끝났음"
		end
	elseif (item.Expire ~= 0) then
		local date = _UtilLogic:GetLocalTimeFrom(DateTime(item.Expire))
		local pattern = "%04d년 %d월 %d일 %02d시 %02d분까지 사용가능"
		attributeTexts[#attributeTexts + 1] = string.format(pattern,
			date.Year, date.Month, date.Day, date.Hour, date.Minute)
	end
end
return table.concat(attributeTexts, "\n")
end