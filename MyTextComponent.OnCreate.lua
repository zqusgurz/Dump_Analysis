return function (self) 
if (not self:IsInitialized()) then
	self._baseRectSize = self.Entity.UITransformComponent.RectSize:Clone()
end
end