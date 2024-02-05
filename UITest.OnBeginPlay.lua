return function (self) 
local ui = self.Entity.UITransformComponent
log(ui.AnchorsMin, ui.AnchorsMax)
log(ui.OffsetMin, ui.OffsetMax)
end