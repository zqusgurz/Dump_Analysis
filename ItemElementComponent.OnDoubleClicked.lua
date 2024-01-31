return function (self) 
if (self.ItemId == 0) then
	return
end
local player = _UserService.LocalPlayer
if (_Items:IsEquip(self.ItemId)) then
	if (player.CharacterActionComponent:CheckAlert()) then
		return
	end
	_InventoryLogic:TryAutoEquip(self.LinkedItemTI, self.LinkedItemPos)
elseif (_Items:IsPet(self.ItemId)) then
	_PetSpawnLogic:TogglePet(self.LinkedItemPos)
elseif (self.LinkedItemTI == 6) then
	-- Do Nothing
else
	_ItemConsumeLogic:TryConsumeItem(self.LinkedItemTI, self.LinkedItemPos)
end
end