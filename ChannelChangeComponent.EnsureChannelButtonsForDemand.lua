return function (self,listCount) 
local entries = self.ChannelButtons
local modelId = "model://68abc9dc-554d-4ee1-a3ab-2245fa580e8b"
for i=#entries+1,listCount do
	local entry = _SpawnService:SpawnByModelId(modelId, "Channel", Vector3.zero, self.Content)
	entries[#entries + 1] = entry
end
end