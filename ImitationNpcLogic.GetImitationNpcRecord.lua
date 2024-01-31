return function (self,templateID) 
---@type ImitationNpcRecord
local record = self.Records[templateID]
if (record) then
	return record
end
record = {}
record.AvatarLook = {}
record.Gender = 1
record.Face = 21000
record.Hair = 31000
record.Skin = 0
record.UserId = ""
record.Name = ""
record.CharacterId = ""
record.Initialized = false
return record
end