return function (self) 
--log("Begin Update Pop")
local app = self:Get()

local statWindow = app.ControlWindowMan.Stat.StatWindowComponent
statWindow.Pop:UpdateStat("POP")
--log("End Update Pop")
end