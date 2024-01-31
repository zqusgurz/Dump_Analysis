return function (self,characterId) 
local currentSummaries = {}
for i=1,self.Max do
	---@type Entity
	local entry = self.Entries[i]
	---@type CharacterSummary
	local summaryData = entry.CharacterSelectEntryComponent.SummaryData
	if (summaryData ~= nil and summaryData.Id ~= characterId) then
		table.insert(currentSummaries, summaryData)
	end
end
self:SetCharacterSummary(self.CharacterSlot, currentSummaries)
end