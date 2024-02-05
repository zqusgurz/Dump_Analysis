return function (self,timeOver) 
---@type MapTimerComponent
local com = self.Timer.MapTimerComponent
self.Timer.Enable = true
com:SetTimer(timeOver)
end