return function (self,item) 
if (item == nil) then
	return false
end
return _NpcShopLogic:IsSellableItem(item)
end