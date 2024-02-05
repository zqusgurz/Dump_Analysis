return function (self) 
---@type MapTimerComponent
local com = self.Timer.MapTimerComponent
com:ResetTimer()
self.Timer.Enable = false
end