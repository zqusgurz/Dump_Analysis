return function (self) 
if (isvalid(self.MaxMap)) then
	self.MaxMap.MiniMapComponent:UnloadMap()
end
if (isvalid(self.MinMap)) then
	self.MinMap.MiniMapComponent:UnloadMap()
end
if (isvalid(self.Min)) then
	self.Min.MiniMapComponent:UnloadMap()
end
end