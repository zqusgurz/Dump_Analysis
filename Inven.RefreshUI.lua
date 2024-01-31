return function (self,category) 
for k, v in ipairs(self.itemSlot) do
	if v.IvenItem.category == category then
		v.IvenItem:SetQuantity()
	end 
end
end