return function (self,input) 
---@type table<CashLockerEntry>
local items = input
local itemNum = #items

self:EnsureCashLockerIcons(itemNum)
local lockerTable = self.LockerItems 

for i=1,itemNum do
	---@type CashLockerEntryComponent
	local entry = lockerTable[i]
	entry.Entity.Enable = true
	entry:SetLockerEntry(items[i])
end
for i=itemNum+1,#lockerTable do
	---@type CashLockerEntryComponent
	local entry = lockerTable[i]
	entry.Entity.Enable = true
	entry:SetLockerEntry(nil)
end

self:CleanOverCashLockerIcons(itemNum)
self:SetSelectedCashLocker(0)
end