return function (self) 
local currentEntry = self.RegisterPreloads[self.CurrentPreloadIndex]
local afterCallback = currentEntry[3]
if (afterCallback) then
	afterCallback()
end
self.CurrentPreloadIndex += 1
self:NextPreload()
end