return function (self) 
if (isvalid(self.HpBar)) then
	self.HpBar.Entity:Destroy()
	self.HpBar = nil
end
end