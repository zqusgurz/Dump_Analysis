return function (self,type) 
if (type == 0) then
	self.Popularity.Color = Color.FromHexCode("#11aa55")
elseif (type == 1) then
	self.Popularity.Color = Color.FromHexCode("#ffcc00")
else
	self.Popularity.Color = Color.FromHexCode("#d12907") -- type 2 or 3
end
end