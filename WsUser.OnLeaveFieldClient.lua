return function (self) 
_AppService:Get().ModalMan:EndChatAll()
local controlMan = _AppService:Get().ControlWindowMan
local tradingRoom = controlMan.TradingRoom.TradingRoomComponent
local npcShop = controlMan.NpcShop.NpcShopComponent
if (tradingRoom:IsVisible()) then
	tradingRoom:SetVisible(false, false)
end
if (npcShop:IsVisible()) then
	npcShop:SetVisible(false, false)
end
end