return function (self,mapName) 
log("Begin PreloadAsync")
self.RegisterPreloads = {}
self.CurrentPreloadIndex = 1

if (Environment:IsPublishedPlay()) then
	if (self.FirstLoad) then
		self.FirstLoad = false
		self:AddFirstLoad()
	end
	self:AddPreloadMap(mapName)
end

self:NextPreload()
end