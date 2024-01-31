return function (self,realPos) 
local multiplier = self:GetMultiplier()
local offset = self.Offset
local rx = (realPos.x + offset.x + (self.CenterX / 100)) * multiplier
local ry = (realPos.y - offset.y - (self.CenterY / 100)) * multiplier

return Vector2(rx, ry)
end