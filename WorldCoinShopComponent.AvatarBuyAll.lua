return function (self) 
local items = {}
for pos,item in pairs(self.CurrentCartAvatar) do
	local productId = item[1]
	items[#items + 1] = productId
end
if (#items > 0) then
	-- TODO
	_UtilDlgLogic:Show("한 번에 구매할 수 있는 아이템이 없습니다.")
else
	_UtilDlgLogic:Show("구매할 아이템이 없습니다.")
end
end