return function (self,type,delta) 
local lookTable = _ItemInfoMan.MakeCharInfo[self.Gender][type]
local currentAvatar = self.Face
if (type == 1) then currentAvatar = self.Hair
elseif (type == 2) then currentAvatar = self.Top
elseif (type == 3) then currentAvatar = self.Pants
elseif (type == 4) then currentAvatar = self.Shoes
elseif (type == 5) then currentAvatar = self.Weapon
end

for i=1,#lookTable do
	if (lookTable[i] == currentAvatar) then
		local newIndex = i + delta
		if (newIndex < 1) then newIndex = #lookTable
		elseif (newIndex > #lookTable) then newIndex = 1 end
		if (type == 0) then self.Face = lookTable[newIndex]
		elseif (type == 1) then self.Hair = lookTable[newIndex]
		elseif (type == 2) then self.Top = lookTable[newIndex]
		elseif (type == 3) then self.Pants = lookTable[newIndex]
		elseif (type == 4) then self.Shoes = lookTable[newIndex]
		elseif (type == 5) then self.Weapon = lookTable[newIndex]
		end
		return
	end
end
end