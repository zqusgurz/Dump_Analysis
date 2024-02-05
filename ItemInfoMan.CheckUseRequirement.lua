return function (self,cd,itemId) 
local itemInfo = self:GetItem(itemId)
if (itemInfo == nil) then
	return 1
end
if (cd.Level < itemInfo.i_reqLevel) then
	return 2
end
-- ReqField (특정 필드에서만 사용 가능?)
return 0
end