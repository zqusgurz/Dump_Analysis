return function (self) 
for i=1,9 do
	self.MyItems[i] = _EntityService:GetEntityByPath(string.format("/ui/ControlWindowGroup/Z1_TradingRoom/MyItem_%d", i))
	self.OtherItems[i] = _EntityService:GetEntityByPath(string.format("/ui/ControlWindowGroup/Z1_TradingRoom/OtherItem_%d", i))
end
self.Entity.SpriteGUIRendererComponent.RaycastTarget = false
self.ChatInput:ConnectEvent(TextInputSubmitEvent, self.OnSubmitChat)
_EntityService:GetEntityByPath("/ui/ControlWindowGroup/Z1_TradingRoom/BtCancel"):ConnectEvent(ButtonClickEvent, self.OnBtCancel)
_EntityService:GetEntityByPath("/ui/ControlWindowGroup/Z1_TradingRoom/BtClaim"):ConnectEvent(ButtonClickEvent, self.OnBtClaim)
self.BtTrade:ConnectEvent(ButtonClickEvent, self.OnBtTrade)
self.MyMesoButton:ConnectEvent(ButtonClickEvent, self.OnBtMeso)
for i=1,9 do
	---@type Entity
	local myItem = self.MyItems[i]
	---@type Entity
	local otherItem = self.OtherItems[i]
	myItem.TradingRoomItemElementComponent.InteractibleOnExclusiveAction = false
	otherItem.TradingRoomItemElementComponent.InteractibleOnExclusiveAction = false
	myItem.Enable = false
	otherItem.Enable = false
end
end