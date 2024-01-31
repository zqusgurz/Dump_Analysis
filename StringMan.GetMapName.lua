return function (self,mapName) 
if (mapName == nil) then
	return ""
end
-- mapName
return self.MapStringMapName[mapName] or ""
end