return function (self,pos) 
local c = self.Entity.Parent.ControlTabComponent
if (isvalid(c)) then
	c:SetFocus()
end
end