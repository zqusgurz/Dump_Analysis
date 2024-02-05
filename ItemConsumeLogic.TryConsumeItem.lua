return function (self,TI,pos) 
local localPlayer = _UserService.LocalPlayer
if (not localPlayer.WsUser:IsAvailableInventoryOperation()) then
	log_warning("try to consume item on unavailable inventory operation")
	return
end
local cd = localPlayer.WsCharacterData
local item = cd:GetItem(TI, pos)
if (item == nil) then
	return
end
local ts = localPlayer.PlayerTemporaryStat
if (ts:GetValue(_CTS.DarkSight) > 0) then
	return
end
local itemId = item.ItemId

local function useItem(arg)
	self:UseConsumeItem(cd.Entity, TI, pos, arg)
end
local function useShopItem(arg)
	_SoundService:PlaySound(_UidMan:Get("Sound/Game.img/UseShopItem"), 1)
	useItem(arg)
end
local function realConsumeItem()
	local consumeType = _ConsumeItemType:GetItemType(itemId)
	if (consumeType == _ConsumeItemType.StateChange or 
		consumeType == _ConsumeItemType.PortalScroll or
		consumeType == _ConsumeItemType.Scripted) then
		useItem(nil)
	elseif (consumeType == _ConsumeItemType.CashScroll) then
		if (itemId == 5050100) then
			_UtilDlgLogic:YesNo("HP와 MP를 제외한 스탯에 투자한 어빌리티 포인트를 되돌립니다.\r\n정말 계속 하시겠습니까?", useShopItem, nil)
		elseif (itemId == 5051001) then
			_UtilDlgLogic:YesNo("초보자 스킬을 제외한 모든 스킬에 투자한 스킬 포인트를 되돌립니다.\r\n정말 계속 하시겠습니까?", useShopItem, nil)
		end
	elseif (consumeType == _ConsumeItemType.CashSpeaker) then
		if (cd.Level < 30) then
			_ChatMessageLogic:Add(_ChatMessageType.Red, "레벨 30 미만은 고성능 확성기를 사용할 수 없습니다.")
			return
		end
		_UtilDlgLogic:Input("확성기로 하고 싶은 말을 입력하세요.", false, "", function(val)
			local len = _Slangs:GetStringByteLength(val)
			if (len <= _Slangs.MinInclusiveLength) then
				_UtilDlgLogic:Show("내용을 입력하세요.")
				return
			end
			if (len > _Slangs.MaxExclusiveLength) then
				_UtilDlgLogic:Show("너무 긴 메시지를 보낼 수 없습니다.")
				return
			end
			useShopItem(val)
		end, nil)
	elseif (consumeType == _ConsumeItemType.PetFood) then
		if (not isvalid(localPlayer.PetOwnerComponent.Pet)) then
			_UtilDlgLogic:Show("먹이를 먹을 수 있는 펫이 없습니다.\n다시 한번 확인해 주세요.")
			return
		end
		useItem(nil)
	end
end

if (_Items:HasItemAttr(item, _ItemAttribute.TradeOnce)) then
	_UtilDlgLogic:YesNo("아이템을 사용하면 다른 사용자와 교환하실 수 없습니다.\n\n그래도 사용하시겠습니까?", function()
		realConsumeItem()
	end, nil)
else
	realConsumeItem()
end

end