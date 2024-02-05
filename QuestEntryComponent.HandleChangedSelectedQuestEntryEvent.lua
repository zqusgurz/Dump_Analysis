return function (self,event) 
local selected = self.Tab == event.Tab and self.Entity == event.SelectedEntry
if (self.Selected ~= selected) then
	self.Selected = selected
	self:ChangedSelected(selected)
end
end