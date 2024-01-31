return function (self,item) 
---@type ItemSlotBase
local ret = {}
ret.ItemId = item.ItemId
ret.Number = item.Number
ret.Attr = item.Attr
ret.Expire = item.Expire
ret.ItemSN = item.ItemSN
if (_Items:IsEquip(item.ItemId)) then
	---@type ItemSlotEquip
	local equip = item
	---@type ItemSlotEquip
	local eqpRet = ret
	eqpRet.RUC = equip.RUC
	eqpRet.CUC = equip.CUC
	eqpRet.STR = equip.STR
	eqpRet.DEX = equip.DEX
	eqpRet.INT = equip.INT
	eqpRet.LUK = equip.LUK
	eqpRet.MHP = equip.MHP
	eqpRet.MMP = equip.MMP
	eqpRet.PAD = equip.PAD
	eqpRet.PDD = equip.PDD
	eqpRet.ACC = equip.ACC
	eqpRet.EVA = equip.EVA
	eqpRet.Craft = equip.Craft
	eqpRet.Speed = equip.Speed
	eqpRet.Jump = equip.Jump
	eqpRet.MAD = equip.MAD
	eqpRet.MDD = equip.MDD
elseif (_Items:IsPet(item.ItemId)) then
	---@type ItemSlotPet
	local pet = item
	---@type ItemSlotPet
	local petRet = ret
	petRet.Name = pet.Name
	petRet.Level = pet.Level
	petRet.Tameness = pet.Tameness
	petRet.Repleteness = pet.Repleteness
	petRet.DeadTime = pet.DeadTime
	petRet.PetAttr = pet.PetAttr
	petRet.PetSkill = pet.PetSkill
end
return ret
end