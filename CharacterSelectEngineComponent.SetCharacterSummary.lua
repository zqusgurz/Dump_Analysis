return function (self,slot,summaries) 
if (slot < 2) then
	slot = 2
end
self.CharacterSlot = slot
---@type table<Entity>
local entries = self.Entries
for i=slot+1,self.Max do
	local entry = entries[i]
	entry.Enable = false
	entry.CharacterSelectEntryComponent:SetData(nil)
end
local summaryNum = #summaries
for i=1,summaryNum do
	---@type CharacterSummary
	local summary = summaries[i]
	local entry = entries[i]
	entry.Enable = true
	entry.CharacterSelectEntryComponent:SetData(summary)
end
for i=summaryNum+1,slot do
	local entry = entries[i]
	entry.CharacterSelectEntryComponent:SetData(nil)
end
self:SetDisabled(false)
end