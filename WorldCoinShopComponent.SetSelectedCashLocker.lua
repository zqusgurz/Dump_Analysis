return function (self,pos) 
self.LockerSelectedNo = pos
for i=1,#self.LockerItems do
	---@type CashLockerEntryComponent
	local entry = self.LockerItems[i]
	entry:SetSelected(i == pos)
end
self.BtRefund.FunctionButtonComponent:SetInteractible(self.LockerItems[pos] ~= nil)
end