return function (self,pos) 
if (self.CashLockerEntry == nil) then
	return
end
self.LastClicked = _UtilLogic.ElapsedSeconds
local win = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
if (win.LockerSelectedNo == self.LockerPos) then
	---@type CashLockerEntry
	local cashLockerEntry = self.CashLockerEntry
	if (cashLockerEntry.Status == 0) then
		if (DateTime(tonumber(cashLockerEntry.RefundPeriod)) > DateTime.UtcNow) then
			_UtilDlgLogic:YesNo("아이템을 수령하면 환불 및 취소할 수 없습니다.\n\n정말 계속하시겠습니까?", function()
				win.LockerLoadingOverlay.Enable = true
				_WorldCoinShopLogic:OpenLockerItem(_UserService.LocalPlayer, cashLockerEntry.Id, cashLockerEntry.ProductId)
			end, nil)
		else
			_UtilDlgLogic:YesNo("아이템을 수령하시겠습니까?", function()
				win.LockerLoadingOverlay.Enable = true
				_WorldCoinShopLogic:OpenLockerItem(_UserService.LocalPlayer, cashLockerEntry.Id, cashLockerEntry.ProductId)
			end, nil)
		end
	else
		_UtilDlgLogic:Show("환불 진행중인 상품은 수령할 수 없습니다.")
	end
else
	win:SetSelectedCashLocker(self.LockerPos)
end
end