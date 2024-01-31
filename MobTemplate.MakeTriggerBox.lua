return function (self,lt,rb,left) 
local center, size = _NumberUtils:GetTriggerBoxFromLtRb(lt, rb, left)
return {
	center, size
}
--return {
--    ColliderOffset = center,
--    BoxSize = size
--}

--local ltPos =  Vector3(lt.x, lt.y, 0)
--local rbPos = Vector3(rb.x, -rb.y, 0)
--local boxSize = rbPos - ltPos
--return {
--    ColliderOffset = Vector2(lt.x + (rb.x - lt.x) / 2, (rb.y - lt.y) / 2 - rb.y),
--    BoxSize = Vector2(boxSize.x, boxSize.y)
--}
end