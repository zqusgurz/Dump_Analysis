return function (self) 
if (not self.Pos1) then
	self.Pos1 = self.Entity:GetChildByName("ItemNoPos1")
	if (not self.Pos1) then
		self.Pos1 = self.Entity:GetChildByName("Pos1")
	end
end
if (not self.Pos2) then
	self.Pos2 = self.Entity:GetChildByName("ItemNoPos2")
	if (not self.Pos2) then
		self.Pos2 = self.Entity:GetChildByName("Pos2")
	end
end
if (not self.Pos3) then
	self.Pos3 = self.Entity:GetChildByName("ItemNoPos3")
	if (not self.Pos3) then
		self.Pos3 = self.Entity:GetChildByName("Pos3")
	end
end
if (not self.Pos4) then
	self.Pos4 = self.Entity:GetChildByName("ItemNoPos4")
	if (not self.Pos4) then
		self.Pos4 = self.Entity:GetChildByName("Pos4")
	end
end
self.Entities[1] = self.Pos1
self.Entities[2] = self.Pos2
self.Entities[3] = self.Pos3
self.Entities[4] = self.Pos4
end