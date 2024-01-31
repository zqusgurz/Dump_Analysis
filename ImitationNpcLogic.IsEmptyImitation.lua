return function (self,npcTemplateId) 
---@type ImitationNpcRecord
local record = self.Records[npcTemplateId]
if (not record or (_UtilLogic:IsNilorEmptyString(record.CharacterId) and _UtilLogic:IsNilorEmptyString(record.UserId))) then
	return true
end
return false
end