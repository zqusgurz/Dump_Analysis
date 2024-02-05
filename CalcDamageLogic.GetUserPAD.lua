return function (self,user,bulletItemId) 
local result = user.WsSecondaryStat.Pad
if (bulletItemId and bulletItemId ~= 0) then
	local bulletItem = _ItemInfoMan:GetItem(bulletItemId)
	result += bulletItem.i_incPAD	
end
return math.min(math.max(0, result), _PlayerStatLogic.MaxPad)
end