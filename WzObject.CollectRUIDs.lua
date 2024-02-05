return function (self,toLoadRUIDs) 
local type = self.Type
if (type == 8 or type == 9) then -- _WzVariantType.Canvas or self.Type == _WzVariantType.Sound
	_TableUtils:AddValidRUID(toLoadRUIDs, self.String)
end
if (type == 8 or type == 0) then -- _WzVariantType.Canvas or self.Type == _WzVariantType.Property
	for _,obj in pairs(self.Children) do
		obj:CollectRUIDs(toLoadRUIDs)
	end
end
end