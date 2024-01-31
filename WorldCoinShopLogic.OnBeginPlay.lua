return function (self) 
if (self:IsServer()) then
	while true do
		if (_DevLogic.LoadedWorldType) then
			break
		end
		wait(0.1)
	end
	local live = _DevLogic.WorldType:sub(1, 4) == "Live"
	self:Load(live, _DevLogic.RegionType)
	_WorldShopService:SetProcessPurchaseCallback(self.OnWorldCoinBuySucceed)
else
	self:ReqLoad()
end
end