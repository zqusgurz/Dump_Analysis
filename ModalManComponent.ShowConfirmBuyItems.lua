return function (self,input,callback) 
---@type table<integer>
local products = input
local modal = self.ConfirmBuyItem
modal.Enable = true
local hasWorldCoin = false
for i=1,#products do
	---@type WorldCoinProduct
	local product = _WorldCoinShopLogic.Products[products[i]]
	if (not product) then
		continue
	end
	if (_Items:IsMaplePointChargeItem(product.ItemId)) then
		hasWorldCoin = true
	end
end
if (hasWorldCoin) then
	modal.ConfirmBuyItemModalComponent:SetPrompt("미사용 포인트는 7일 이내에 취소가 가능합니다.\n이 아이템을 정말로 구매하시겠습니까?")
else
	modal.ConfirmBuyItemModalComponent:SetPrompt("구매 후 취소 또는 환불이 불가합니다.\n이 아이템을 정말로 구매하시겠습니까?")
end
modal.ConfirmBuyItemModalComponent:SetItemList(input)
modal.ConfirmBuyItemModalComponent:SetCallback(callback)
end