return function (self,count) 
local slotNum = math.max(2, (count + 5) // 6) * 6

for i=#self.LockerItems+1,slotNum do
	local obj = _SpawnService:SpawnByModelId("model://38883bc2-6419-4e85-b7ee-db6a0bf78d20", "CashLockerEntry", Vector3.zero, self.LockerRoot)
	self.LockerItems[i] = obj.CashLockerEntryComponent
	obj.CashLockerEntryComponent:SetLockerEntry(nil)
	obj.CashLockerEntryComponent.LockerPos = i
end
end