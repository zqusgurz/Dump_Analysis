return function (self,itemDrops) 
for _,d in pairs(itemDrops) do
	self:EnterDrop(d, _DropAppearType.Normal, 0)
end
end