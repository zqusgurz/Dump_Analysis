return function (self) 
local mmi = self.Entity.MemoryInitValuesComponent
if (isvalid(mmi)) then
	self._baseRectSize = mmi.OriginRectSize:Clone()
else
	self._baseRectSize = self.Entity.UITransformComponent.RectSize:Clone()
end
self:InitTextComponent()
_FontService.AllMyTextComponents[#_FontService.AllMyTextComponents + 1] = self
end