return function (self,from,tradePos,i) 
local tradingRoom = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
local mine = _UserService.LocalPlayer.OwnerId == from
---@type Entity
local tradeItem = nil
if (mine) then
	tradeItem = tradingRoom.MyItems[tradePos]
else
	tradeItem = tradingRoom.OtherItems[tradePos]
end
if (not tradeItem) then
	log_error("tradePos is nil: ", tradePos, "/mine:", mine)
	return
end
---@type ItemSlotBase
local item = i
local itemElement = tradeItem.TradingRoomItemElementComponent
itemElement:SetItemRaw(item)
if (_Items:IsEquip(item.ItemId)) then
	itemElement:SetItemNo(-1)
else
	itemElement:SetItemNo(item.Number)
end
itemElement.Item = item
end