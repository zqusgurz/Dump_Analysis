return function (self,item,srcPos,dstPos,player,cd) 
if (item.LinkedTI ~= 2) then
	return
end
if (dstPos ~= _ConsumeItemElementType.HP and dstPos ~= _ConsumeItemElementType.MP) then
	return
end
local rawItem = _InventoryLogic:RawGetItem(cd, 2, srcPos)
if (rawItem == nil) then
	return
end
local consumeType = _ConsumeItemType:GetItemType(rawItem.ItemId)
if (consumeType ~= _ConsumeItemType.StateChange) then
	return
end
local pet = player.PetOwnerComponent.Pet
if (not isvalid(pet)) then
	return
end
local itemInfo = _ItemInfoMan:GetItem(rawItem.ItemId)
if (dstPos == _ConsumeItemElementType.HP) then
	if (itemInfo.s_hp == 0 and itemInfo.s_hpR == 0) then
		return
	end
	if (not _Items:HasPetSkillAttr2(pet.PetComponent, _PetSkillAttribute.ConsumeHP)) then
		return
	end
elseif (dstPos == _ConsumeItemElementType.MP) then
	if (itemInfo.s_mp == 0 and itemInfo.s_mpR == 0) then
		return
	end
	if (not _Items:HasPetSkillAttr2(pet.PetComponent, _PetSkillAttribute.ConsumeMP)) then
		return
	end
end
_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
player.WsUser:TrySetConsumeItem(rawItem.ItemId, dstPos)
_AppService:Get().OptionMan.SysOpt.Enable = true
if (dstPos == _ConsumeItemElementType.HP) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "시스템옵션의 HP 경고표시가 깜빡일 때 물약을 복용하게 됩니다.")
else
	_ChatMessageLogic:Add(_ChatMessageType.Red, "시스템옵션의 MP 경고표시가 깜빡일 때 물약을 복용하게 됩니다.")
end
end