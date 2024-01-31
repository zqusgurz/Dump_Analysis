return function (self) 
local value = self:HandleUOL()
if (value.Type == 6) then -- _WzVariantType.String
	return tonumber(value.String)
end
return value.Number
end