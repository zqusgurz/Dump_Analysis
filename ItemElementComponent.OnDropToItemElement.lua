return function (self,item,srcPos,dstPos,player,cd) 
if (item.LinkedTI == 2 and self.LinkedItemTI == 1) then
	if (self.LinkedItemPos < 0) then
		_ItemUpgradeLogic:OnUpgradeItemByInventory(srcPos, dstPos, false)	
	end
	return
end

-- 장착중 -> 인벤창
if (item.LinkedTI == 1 and srcPos < 0) then
	-- 장착중 -> 장착중은 지원 안함
	if (self.LinkedItemTI == 1 and dstPos < 0) then
		return
	end
	if (self.LinkedItemTI == 0) then
		return
	end
	-- 장착중 -> 장비 제외 탭
	if (self.LinkedItemTI ~= 1) then
		local tabs = _EntityService:GetEntity("0917980b-7fcd-4900-a906-3fb674c647cc") -- Tabs
		_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
		-- 장비탭으로다가 선택시켜준다
		tabs.TabsComponent:OnSelectedTab(1)
		return
	end
	-- 해당 파츠에 캐시 장비를 장착중인가?
	if (player.WsCharacterData:IsEquippingCashPart(srcPos)) then
		srcPos -= 100
	end
elseif (self.LinkedItemTI ~= item.ItemId // 1000000) then
	-- 아예 TI가 다른데 어떻게 이동시키려고?
	return
end

-- 인벤창 -> 장착중
if (self.LinkedItemTI == 1 and dstPos < 0) then
	if (item.LinkedTI == 1 and srcPos > 0) then
		local rawItem = _InventoryLogic:RawGetItem(cd, 1, srcPos)
		if (rawItem == nil) then
			return
		end
		if (not _Items:IsCorrectBodyPart(rawItem.ItemId, -dstPos, cd.Gender)) then
			log("not correct body part")
			return
		end
		-- 착용하려는 파츠가 캐시 아이템인가?
		if (_Items:IsCashItem(rawItem.ItemId)) then
			dstPos -= 100
		end
		local bs = player.WsBasicStat
		if (not _Items:IsAbleToEquip(rawItem.ItemId, cd.Level, cd.Job, bs.Str, bs.Dex, bs.Int, bs.Luk, cd.Pop, -dstPos, cd.Gender)) then
			--log("not able to equip")
			_UtilDlgLogic:Show("현재 능력치가 낮아서 선택된 아이템을 장착할 수 없습니다.")
			return
		end
	end
end

if (self.LinkedItemTI ~= 1 or item.LinkedTI ~= 1) then
	if (self.LinkedItemTI ~= item.LinkedTI) then
		--log(string.format("TI %d <-> %d not available", self.LinkedItemTI, item.LinkedTI))
		return
	end
end
if (srcPos == dstPos) then
	--log(string.format("TI %d->%d srcPos %d -> dstPos %d not available", item.LinkedTI, self.LinkedItemTI, srcPos, dstPos))
	return
end

local function sendChangeSlot()
	player.WsUser.ExclusiveAction = true
	_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
	log(string.format("[%d] %d -> %d", self.LinkedItemTI, srcPos, dstPos))
	_InventoryLogic:ChangeSlotPosition(cd, self.LinkedItemTI, srcPos, dstPos)
end

if (item.LinkedTI == 1 and self.LinkedItemTI == 1 and (srcPos < 0 or dstPos < 0)) then
	local invPos = srcPos < 0 and dstPos or srcPos
	local rawItem = _InventoryLogic:RawGetItem(cd, 1, invPos)
	if (rawItem and _Items:HasItemAttr(rawItem, _ItemAttribute.TradeOnce)) then
		_UtilDlgLogic:YesNo("착용 후에는 거래할 수 없는 장비입니다.\n 착용하시겠습니까?", function()
			sendChangeSlot()
		end, nil)
	else
		sendChangeSlot()
	end
else
	sendChangeSlot()
end

end