return function (self,count) 
local currentSlotNum = math.max(2, (count + 5) // 6) * 6

---@type table<CashLockerEntryComponent>
local items = self.LockerItems

for i=currentSlotNum+1,#items do
	local item = items[i]
	item.Entity.Enable = false
end
end