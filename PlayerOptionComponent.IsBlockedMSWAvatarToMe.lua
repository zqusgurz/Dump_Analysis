return function (self,userId) 
local beforeOptionsString = self:GetString("BlockAvatar", "{}")
local beforeOptions = _HttpService:JSONDecode(beforeOptionsString)
local targetOption = beforeOptions[userId]
if (targetOption == nil) then
	return false
end
return true
end