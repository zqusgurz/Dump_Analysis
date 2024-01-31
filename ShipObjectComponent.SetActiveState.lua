return function (self,activated) 
if (activated) then
	if (self.ShipKind == 0) then
		self:Enter()
	else
		self:Appear()
	end
else
	if (self.ShipKind == 0) then
		self:Leave()
	else
		self:Disappear()
	end
end
end