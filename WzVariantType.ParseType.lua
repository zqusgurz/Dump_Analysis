return function (self,type) 
if (type == "Int16") then
	return 1-- _WzVariantType.I16
elseif (type == "Int32") then
	return 2 -- _WzVariantType.I32
elseif (type == "Int64") then
	return 3 -- _WzVariantType.I64
elseif (type == "Float") then
	return 4 -- _WzVariantType.Float
elseif (type == "Double") then
	return 5 -- _WzVariantType.Double
elseif (type == "String") then
    return 6 -- _WzVariantType.String
elseif (type == "Vector2D") then
	return 7 -- _WzVariantType.Vector2D
elseif (type == "Canvas") then
    return 8 -- _WzVariantType.Canvas
elseif (type == "Property") then
	return 0 -- _WzVariantType.Property
elseif (type == "Sound") then
    return 9 -- _WzVariantType.Sound
elseif (type == "UOL") then
    return 10 -- _WzVariantType.UOL
end
return nil
end