return function (self) 
local currentCreatedChara = 0
for i=1,self.Max do
	---@type Entity
	local entry = self.Entries[i]
	if (entry.CharacterSelectEntryComponent.SummaryData ~= nil) then
		currentCreatedChara += 1
	end
end
return currentCreatedChara
end