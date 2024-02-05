return function (self,itemId) 
if (itemId // 1000000 == 1) then
	local type = (itemId // 10000) % 100
	for i=1,#self.WeaponTypes do
		if (type == self.WeaponTypes[i]) then
			return type
		end
	end
end
return 0
end