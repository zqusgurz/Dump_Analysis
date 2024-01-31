return function (self,text,character,pos,scale,color,adjustLegacy) 
self.Character = character
local e = self.Entity
local s = e.SpriteGUIRendererComponent
s.Color = color

---@type Glyph
local glyph = _FontService:EnsureGetGlyph(text.Font, character)

s.ImageRUID = glyph.RUID
local size = glyph.Size
local offset = glyph.Offset
--if (self.Entity.UITransformComponent.UIMode == UIModeType.Screen) then
local x = pos.x + offset.x
local y = pos.y - offset.y
if (adjustLegacy) then
	x += 2
	y -= 2
end
_EntityUtils:SetUIEntitySafelyEx(e, x, y, size.x, size.y)

--else
--    local newPos = self.Entity.UITransformComponent.WorldPosition:ToVector2()
--    newPos = (newPos + Vector2(glyph.Offset.x + 1, -(glyph.Offset.y + 1))) * 0.01
--    self.Entity.UITransformComponent.WorldPosition = newPos:ToVector3()
--end

return Vector2(glyph.XAdvance, offset.y + glyph.Size.y)
end