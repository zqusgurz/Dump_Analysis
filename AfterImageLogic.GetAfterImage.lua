return function (self,afterImageType,action,masteryLevel) 
--log("Get:", afterImageType, masteryLevel, action)
local tb = self.Afterimages[afterImageType]
local afterImageRoot = nil
for i=0,masteryLevel do
	if (tb[i]) then
		afterImageRoot = tb[i]	
	end
end
if (not afterImageRoot or not afterImageRoot[action]) then
	-- log_error("No after image: ", string.format("type: %s, masterLevel: %d, action: %s", afterImageType, masteryLevel, action))
	return nil
end
return afterImageRoot[action]
end