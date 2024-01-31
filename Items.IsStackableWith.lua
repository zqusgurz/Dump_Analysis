return function (self,this,that) 
local mergeableAttributes = _ItemAttribute.NoTrade | _ItemAttribute.NotSale;

if (this == nil or that == nil) then
	return false
end
if (this.ItemId ~= that.ItemId) then
	return false
end
if (this.Expire ~= 0 or that.Expire ~= 0) then
	return false
end
if ((this.Attr & ~mergeableAttributes) ~= 0 or (that.Attr & ~mergeableAttributes) ~= 0) then
	return false
end
if (_Items:IsTreatSingly(this.ItemId)) then
	return false
end
if ((this.Attr & mergeableAttributes) ~= (that.Attr & mergeableAttributes)) then
	return false
end
if (this.ItemSN ~= 0 or that.ItemSN ~= 0) then
	return false
end
return true
end