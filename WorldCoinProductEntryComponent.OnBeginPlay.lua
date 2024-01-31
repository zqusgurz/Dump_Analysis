return function (self) 
self.ItemIcon.Entity:ConnectEvent(UITouchEnterEvent, self._OnHandleUITouchEnterEvent)
self.ItemIcon.Entity:ConnectEvent(UITouchExitEvent, self._OnHandleUITouchExitEvent)
self.ItemIcon.Entity:ConnectEvent(UITouchDownEvent, self._OnHandleUITouchDownEvent)
if not (isvalid(self.ItemIcon.Entity.UITouchReceiveComponent)) then
	self.ItemIcon.Entity:AddComponent(UITouchReceiveComponent)
end
if not (isvalid(self.Entity.UITouchReceiveComponent)) then
	self.Entity:AddComponent(UITouchReceiveComponent)
end
self.BtBuy:ConnectEvent(ButtonClickEvent, self.OnBuyButton)
end