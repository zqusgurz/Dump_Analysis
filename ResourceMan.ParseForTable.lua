return function (self,o) 
if (o == nil) then
	return nil
end
if (o.Type == 8 or o.Type == 0) then
	return o:ToTable()
elseif (o.Type == 5 or o.Type == 4 or
		o.Type == 1 or o.Type == 2 or
		o.Type == 3) then
	return tostring(o.Number)
elseif (o.Type == 9 or o.Type == 6) then
	return o.String
elseif (o.Type == 7) then
	return string.format("%f,%f",o.Vector.x, o.Vector.y)
elseif (o.Type == 10) then
	return self:ParseForTable(o:HandleUOL())
end
--if (o.Type == _WzVariantType.Canvas or o.Type == _WzVariantType.Property) then
--    return o:ToTable()
--elseif (o.Type == _WzVariantType.Double or o.Type == _WzVariantType.Float or
--        o.Type == _WzVariantType.I16 or o.Type == _WzVariantType.I32 or
--        o.Type == _WzVariantType.I64) then
--    return tostring(o.Number)
--elseif (o.Type == _WzVariantType.Sound or o.Type == _WzVariantType.String) then
--    return o.String
--elseif (o.Type == _WzVariantType.Vector2D) then
--    return string.format("%f,%f",o.Vector.x, o.Vector.y)
--elseif (o.Type == _WzVariantType.UOL) then
--    return self:ParseForTable(o:HandleUOL())
--end
return ""
end