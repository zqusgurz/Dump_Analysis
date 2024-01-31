return function (self,itemId,number) 
if (_Items:IsEquip(itemId)) then
	local info = self:GetEquip(itemId)
	if (info == nil) then
		log_error("No equip item: ", itemId)
		return nil
	end
	---@type ItemSlotEquip
	local eqp = {}
	eqp.STR = info.incSTR
	eqp.DEX = info.incDEX
	eqp.INT = info.incINT
	eqp.LUK = info.incLUK
	eqp.MHP = info.incMHP
	eqp.MMP = info.incMMP
	eqp.PAD = info.incPAD
	eqp.PDD = info.incPDD
	eqp.MAD = info.incMAD
	eqp.MDD = info.incMDD
	eqp.ACC = info.incACC
	eqp.EVA = info.incEVA
	eqp.Craft = 0
	eqp.Speed = info.incSpeed
	eqp.Jump = info.incJump
	eqp.CUC = 0
	eqp.RUC = info.tuc
	eqp.Attr = 0
	eqp.Expire = 0
	eqp.Number = 1
	eqp.ItemId = itemId
	eqp.ItemSN = self.SessionIndex + self.ItemSNCounter
	self.ItemSNCounter += 1
	return eqp
elseif (_Items:IsPet(itemId)) then
	local info = self:GetItem(itemId)
	if (info == nil) then
		log_error("No regular item: ", itemId)
		return nil
	end
	---@type ItemSlotPet
	local item = {}
	item.Attr = 0
	item.ItemId = itemId
	item.Number = 1
	item.Expire = 0
	item.ItemSN = self.SessionIndex + self.ItemSNCounter
	self.ItemSNCounter += 1
	
	item.Name = ""
	item.Level = 1
	item.Tameness = 0
	item.Repleteness = 100
	item.DeadTime = (DateTime.UtcNow + TimeSpan.FromDays(info.i_life)).Elapsed
	item.PetAttr = 0
	item.PetSkill = 0
	if (info.i_pickupItem ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.PickUpItem, true)
	end
	if (info.i_longRange ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.LongRange, true)
	end
	if (info.i_sweepForDrop ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.DropSweep, true)
	end
	if (info.i_pickupAll ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.PickUpAll, true)
	end
	if (info.i_consumeHP ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.ConsumeHP, true)
	end
	if (info.i_consumeMP ~= 0) then
		_Items:SetPetSkillAttr(item, _PetSkillAttribute.ConsumeMP, true)
	end
	return item
else
	local info = self:GetItem(itemId)
	if (info == nil) then
		log_error("No regular item: ", itemId)
		return nil
	end
	---@type ItemSlotBase
	local item = {}
	item.Attr = 0
	item.ItemId = itemId
	item.Number = number
	item.Expire = 0
	if (_Items:IsTreatSingly(itemId) or info.i_cash == 1) then
		item.ItemSN = self.SessionIndex + self.ItemSNCounter
		self.ItemSNCounter += 1
	else
		item.ItemSN = 0
	end
	return item
end
end