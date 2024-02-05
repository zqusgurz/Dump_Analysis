return function (self,id) 
for i=1,#self.LockerItems do
	---@type CashLockerEntryComponent
	local item = self.LockerItems[i]
	if (not item) then
		continue
	end
	---@type CashLockerEntry
	local entry = item.CashLockerEntry
	if (not entry) then
		continue
	end
	if (item.Entity.Enable and entry.Id == id) then
		entry.Status = 1
		item:SetLockerEntry(entry)
	end
end
end