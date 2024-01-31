return function (self) 
local pos = self.LockerSelectedNo
---@type CashLockerEntryComponent
local entry = self.LockerItems[pos]
if (entry) then
	---@type CashLockerEntry
	local data = entry.CashLockerEntry
	if (data.Status == 0) then
		if (DateTime.UtcNow < DateTime(tonumber(data.RefundPeriod))) then
			local prompt = string.format("청약 철회는 운영자 확인 후 환불 처리가 진행되므로 시간이 소요됩니다.\n\n청약 철회를 진행할 경우, 취소할 수 없습니다.\n\n정말 환불을 계속 진행하시겠습니까?\n환불이 진행될 월드 코인은 %d WC 입니다.",
				data.WorldCoin)
			_UtilDlgLogic:YesNo(prompt, function()
				self.LockerLoadingOverlay.Enable = true
				_WorldCoinShopLogic:RefundLockerItem(_UserService.LocalPlayer, data.Id)
			end, nil)
		else
			_UtilDlgLogic:Show("청약 철회가 불가능한 상품입니다.")
		end
	else
		_UtilDlgLogic:Show("현재 환불 진행 중인 상품입니다.")
	end	
end
end