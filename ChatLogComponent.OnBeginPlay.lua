return function (self) 
self.Entity_MinButton:ConnectEvent(ButtonClickEvent, function()
	self.ChatSystem:SetEnabledChatInput(false)
	self:SetSpreadChatLogAndReposition(false)
end)
self.Entity_MaxButton:ConnectEvent(ButtonClickEvent, function()
	self:SetSpreadChatLogAndReposition(true)
	self.ChatSystem:SetEnabledChatInput(true)
end)
if (_DebugConstants:IsMobile()) then
	self.MobileSpreadLayer:ConnectEvent(UITouchDownEvent, function()
		self:SetSpreadChatLogAndReposition(true)
		self.ChatSystem:SetEnabledChatInput(true)
	end)
end
self.ChatResizeHandle:ConnectEvent(UITouchDragEvent, function(e)
	---@type UITouchDragEvent
	local event = e
	self.AccumulatedResizeDelta = self.AccumulatedResizeDelta + (event.TouchDelta.y * _ControlWindowLogic.UIRatio.y)
	if (self.AccumulatedResizeDelta < -18) then
		self.AccumulatedResizeDelta = self.AccumulatedResizeDelta + 18
		self.SpreadHeight = math.max(2, self.SpreadHeight - 1)
		self:RepositionChatLog()
	elseif (self.AccumulatedResizeDelta > 18) then
		self.AccumulatedResizeDelta = self.AccumulatedResizeDelta - 18
		self.SpreadHeight = math.min(20, self.SpreadHeight + 1)
		self:RepositionChatLog()
	end
end)

-- 테스트용
local lastY = 0
self.Entity_Layout:ConnectEvent(ScrollPositionChangedEvent, function(event)
	---@type ScrollPositionChangedEvent
	local ev = event
	local currentY = ev.NormalizedPosition.y
	-- log("ScrollPositionChangedTo: ", currentY)
	if (currentY - lastY > 0.9) then
		self:MoveToBottom()
	end
	lastY = currentY
end)

if (_DebugConstants:IsMobile()) then
	local xOffset = 220
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, 562 - xOffset, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity_Layout, 562 - xOffset, nil)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_MinButton, 536 - xOffset + 10, nil)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_MaxButton, 536 - xOffset, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.MobilePlaceholder, 562 - xOffset, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.MobileSpreadLayer, 562 - xOffset, nil)
end
end