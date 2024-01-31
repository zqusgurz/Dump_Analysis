return function (self,statTable) 
local stats = statTable.Key
local function setStat(stat, t)
	self.Value[stat] = t.Value
	self.Reason[stat] = t.Reason
	self.Expire[stat] = t.Expire
	self.AdditionalData[stat] = t.AdditionalData
end
for i=1,#stats do
	local stat = stats[i]
	setStat(stat, statTable[stat])
end
end