return function (self,category) 
for k, v in ipairs(self.itemSlot) do
	if v.IvenItem.category == category then
		v.Enable = true
	else
		v.Enable = false
	end
end
end