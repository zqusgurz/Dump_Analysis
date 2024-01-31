return function (self,cd,itemId,showChatLog) 
local check = _ItemInfoMan:CheckUseRequirement(cd, itemId)
if (showChatLog) then
	if (check == 2) then
		-- 현재 레벨이 낮아서 선택된 아이템을 소비할 수 없습니다.
	end
end
return check == 0
end