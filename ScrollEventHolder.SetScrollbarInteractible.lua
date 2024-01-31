return function (self,entity,b) 
---@type ControlScrollBarComponent
local scrollBar = self.ConnectedScrollbar[entity]
if (scrollBar) then
	scrollBar:SetInteractable(b)
end
end