return function (self,templateID,userId,characterId) 
---@type ImitationNpcRecord
local record = self.Records[templateID]
if (not record) then
	return false
end
if (record.Initialized) then
	return true
end
if (not _UtilLogic:IsNilorEmptyString(record.CharacterId)) then
	return record.CharacterId == characterId
end
return record.UserId == userId
end