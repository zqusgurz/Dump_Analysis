return function (self,index) 
self.SelectedIndex = index
self.SelectedText.Text = self.Selections[index]
self:CloseDropdown()
end