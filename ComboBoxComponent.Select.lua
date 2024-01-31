return function (self,index) 
self.SelectedIndex = index
local text = self.Selections[index]
self.SelectedText.Text = text
self.Entity:SendEvent(ComboboxChangedSelectionEvent(text, index))
self:CloseDropdown()
end