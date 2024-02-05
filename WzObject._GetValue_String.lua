return function (self) 
local value = self:HandleUOL()
if (value == nil) then
--	log_error("nil after handle UOL?????? why???? " .. self:GetFullPath())
	value = self:HandleUOL()
end
local type = value.Type
if (type == 1 or -- _WzVariantType.I16
	type == 2 or -- _WzVariantType.I32
	type == 3 or -- _WzVariantType.I64
	type == 4 or -- _WzVariantType.Float
	type == 5) then -- _WzVariantType.Double
	return tostring(value.Number)
elseif (type == 7) then -- _WzVariantType.Vector2D
	return string.format("[%s,%s]", tostring(value.Vector.x), tostring(value.Vector.y))
else
	return value.String
end
end