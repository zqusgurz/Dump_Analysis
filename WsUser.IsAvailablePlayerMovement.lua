return function (self) 
if (self.Migrating) then
	return false
end
if (_UtilDlgLogic:IsActiveModal()) then
	return false
end
if (_UtilDlgLogic:IsActiveBlockingMovementWindow()) then
	return false
end
if (self.CurrentNpcShop ~= 0) then
	return false
end
if (self.TradeId > 0) then
	return false
end
return true
end