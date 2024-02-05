return function (self) 
local scrollBar = self.ScrollBar
if (not isvalid(scrollBar)) then
	local p = self.Entity.Parent
	self.ScrollBar = p.ControlScrollBarComponent
	scrollBar = self.ScrollBar
end
return scrollBar
end