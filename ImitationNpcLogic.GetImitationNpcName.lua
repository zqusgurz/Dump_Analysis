return function (self,templateID) 
---@type ImitationNpcRecord
local record = self.Records[templateID]
if (not record or not record.Initialized) then
	return "이름없음"
end
return record.Name
end