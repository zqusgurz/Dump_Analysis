return function (self,records) 
local allRecords = {}
for id,_ in pairs(self.Records) do
	allRecords[id] = true
end
for id,_ in pairs(records) do
	allRecords[id] = true
end
self.Records = records
for id,_ in pairs(allRecords) do
	self:SendEvent(UpdateImitationNpcRecordEvent(id))
end
end