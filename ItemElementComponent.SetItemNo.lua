return function (self,val) 
if (val < 0) then
	self.ItemNo.Entity.Enable = false
else
	self.ItemNo.Entity.Enable = true
	self.ItemNo.Value = val
	self.ItemNo:Render()
end
end