return function (self,mapName) 
if (mapName == nil) then
	return ""
end
-- streetName
return self.MapStringStreetName[mapName] or ""
end