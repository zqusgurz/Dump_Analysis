return function (self) 
local height = (self.SpreadChatLog and self.SpreadHeight or 1) * 18
local yOffset
if (self.ChatSystem.EnabledChatInput or self.SpreadChatLog) then
	if (_DebugConstants:IsMobile()) then
		yOffset = 21.5
	else	
		yOffset = 26
	end
else
	yOffset = 1.5
end

_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity_Border, nil, height)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity_Layout, nil, height)
_EntityUtils:SetUIEntitySafelyEx(self.Entity, nil, yOffset, nil, height + 2)
if (_DebugConstants:IsMobile()) then
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.DragMoveArea, nil, height + 2 + yOffset)
end

self:MoveToBottom()
end