return function (self,otherUser) 
local controlMan = _AppService:Get().ControlWindowMan
local trade = controlMan.TradingRoom.TradingRoomComponent
if (not trade:IsVisible()) then
	trade:SetVisible(true, false)
	local inven = controlMan.Item.ItemWindowComponent
	if (not inven:IsVisible()) then
		inven:SetVisible(true, false)
	end
end
trade.OtherPlayer = otherUser
trade:ResetDialog()
end