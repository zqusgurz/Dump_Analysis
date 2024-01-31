return function (self,summaryForSend) 
---@type CharacterSummary
local summary = summaryForSend
---@type table<Entity>
local entries = self.Entries
for i=1,self.Max do
	local entry = entries[i]
	if (entry.CharacterSelectEntryComponent.SummaryData == nil) then
		entry.CharacterSelectEntryComponent:SetData(summary)
		self:UpdateSignboardButton()
		return
	end
end
log_error("fatal error! no more character slot")
end