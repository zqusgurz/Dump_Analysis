return function (self,c) 
if (c == "b") then
	return Color.blue
elseif (c == "r") then
	return Color.red
elseif (c == "g") then
	return Color.green
elseif (c == "d") then
	return Color.FromHexCode("#553388")
end
return self.DefaultColor
end