return function (self,item) 
local flag = 0
if (_Items:IsPet(item.ItemId)) then
	---@type ItemSlotPet
	local pet = item
	if (DateTime(pet.DeadTime) < DateTime.UtcNow) then
		flag |= self.PetDead
	end
end
return flag
end