return function (self) 
local stats = {}
local index = 1

for i=1,self.MaxStatId do
	local val = self.Value[i]
	if (val ~= nil and val ~= 0) then
		stats[index] = i
		index += 1
		-- log("ClearStat: ", i , "/val:", val)
	end
	self.Expire[i] = nil
	self.Value[i] = nil
	self.Reason[i] = nil
	self.AdditionalData[i] = nil
end

return stats
end