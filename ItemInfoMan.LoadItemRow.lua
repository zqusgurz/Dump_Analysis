return function (self,itemId,row,fromCustom) 
---@param eqp UserDataRow
local function loadEquip(eqp)
	---@type EquipItemInfo
	local info = {}
	info.ItemId = itemId
	info.AvatarRUID = eqp:GetItem("AvatarRUID")
	info.afterImage = eqp:GetItem("afterImage") or ""
	info.attack = tonumber(eqp:GetItem("attack") or "0")
	info.attackSpeed = tonumber(eqp:GetItem("attackSpeed") or "0")
	info.cash = tonumber(eqp:GetItem("cash") or "0")
	info.chatBalloon = tonumber(eqp:GetItem("chatBalloon") or "0")
	info.expireOnLogout = tonumber(eqp:GetItem("expireOnLogout") or "0")
	info.fs = tonumber(eqp:GetItem("fs") or "0")
	local tempicon = _UtilLogic:Split(eqp:GetItem("icon"),",")
	if (#tempicon > 1) then
		info.icon = tempicon[1]
		info.iconOrigin = Vector2(tonumber(tempicon[2]), tonumber(tempicon[3]))
		info.iconSize = Vector2(tonumber(tempicon[4]), tonumber(tempicon[5]))
	else
		info.icon = ""
		info.iconOrigin = Vector2.zero
		info.iconSize = Vector2.zero
	end
	local tempiconRawRaw = _UtilLogic:Split(eqp:GetItem("iconRaw"),",")
	if (#tempiconRawRaw > 1) then
		info.iconRaw = tempiconRawRaw[1]
		info.iconRawOrigin = Vector2(tonumber(tempiconRawRaw[2]), tonumber(tempiconRawRaw[3]))
		info.iconRawSize = Vector2(tonumber(tempiconRawRaw[4]), tonumber(tempiconRawRaw[5]))
	else
		info.iconRaw = ""
		info.iconRawOrigin = Vector2.zero
		info.iconRawSize = Vector2.zero
	end
	info.incACC = tonumber(eqp:GetItem("incACC") or "0")
	info.incDEX = tonumber(eqp:GetItem("incDEX") or "0")
	info.incEVA = tonumber(eqp:GetItem("incEVA") or "0")
	info.incINT = tonumber(eqp:GetItem("incINT") or "0")
	info.incJump = tonumber(eqp:GetItem("incJump") or "0")
	info.incLUk = tonumber(eqp:GetItem("incLUk") or "0")
	info.incLUK = tonumber(eqp:GetItem("incLUK") or "0")
	info.incMAD = tonumber(eqp:GetItem("incMAD") or "0")
	info.incMDD = tonumber(eqp:GetItem("incMDD") or "0")
	info.incMHP = tonumber(eqp:GetItem("incMHP") or "0")
	info.incMMD = tonumber(eqp:GetItem("incMMD") or "0")
	info.incMMP = tonumber(eqp:GetItem("incMMP") or "0")
	info.incPAD = tonumber(eqp:GetItem("incPAD") or "0")
	info.incPDD = tonumber(eqp:GetItem("incPDD") or "0")
	info.incSpeed = tonumber(eqp:GetItem("incSpeed") or "0")
	info.incSTR = tonumber(eqp:GetItem("incSTR") or "0")
	info.islot = eqp:GetItem("islot") or ""
	info.knockback = tonumber(eqp:GetItem("knockback") or "0")
	info.nameTag = tonumber(eqp:GetItem("nameTag") or "0")
	info.notSale = tonumber(eqp:GetItem("notSale") or "0")
	info.only = tonumber(eqp:GetItem("only") or "0")
	info.pachinko = tonumber(eqp:GetItem("pachinko") or "0")
	info.price = tonumber(eqp:GetItem("price") or "0")
	info.quest = tonumber(eqp:GetItem("quest") or "0")
	info.recovery = tonumber(eqp:GetItem("recovery") or "0")
	info.regPOP = tonumber(eqp:GetItem("regPOP") or "0")
	info.reqDEX = tonumber(eqp:GetItem("reqDEX") or "0")
	info.reqINT = tonumber(eqp:GetItem("reqINT") or "0")
	info.reqJob = tonumber(eqp:GetItem("reqJob") or "0")
	info.reqLevel = tonumber(eqp:GetItem("reqLevel") or "0")
	info.reqLUK = tonumber(eqp:GetItem("reqLUK") or "0")
	info.reqPOP = tonumber(eqp:GetItem("reqPOP") or "0")
	info.reqSTR = tonumber(eqp:GetItem("reqSTR") or "0")
	info.sample = eqp:GetItem("sample") or ""
	info.sfx = eqp:GetItem("sfx") or ""
	info.slotMax = tonumber(eqp:GetItem("slotMax") or "0")
	info.stand = tonumber(eqp:GetItem("stand") or "0")
	info.timeLimited = tonumber(eqp:GetItem("timeLimited") or "0")
	info.tradeBlock = tonumber(eqp:GetItem("tradeBlock") or "0")
	info.tuc = tonumber(eqp:GetItem("tuc") or "0")
	info.vslot = eqp:GetItem("vslot") or ""
	info.walk = tonumber(eqp:GetItem("walk") or "0")
	self._iconRawAnimations[info.ItemId] = _AnimationMan:MakeSingleAnimation(info.iconRaw, info.iconRawSize, info.iconRawOrigin)
	return info
end

local customItemFields = self.CustomItemDataField

---@param item UserDataRow
---@return ItemInfo
local function loadItem(item)	
	---@type function(e: UserDataRow,column: string): string
	local getItem = function (e, column)
		if (fromCustom and not customItemFields[column]) then			
			return ""
		end
		return e:GetItem(column)
	end
	
	---@type ItemInfo
	local info = {}
	
	info.ItemId = itemId
	
	local tempicon = _UtilLogic:Split(getItem(item, "i_icon"),",")
	if (#tempicon > 1) then
		info.icon = tempicon[1]
		info.iconOrigin = Vector2(tonumber(tempicon[2]), tonumber(tempicon[3]))
		info.iconSize = Vector2(tonumber(tempicon[4]), tonumber(tempicon[5]))
	else
		info.icon = ""
		info.iconOrigin = Vector2.zero
		info.iconSize = Vector2.zero
	end
	local tempiconRawRaw = _UtilLogic:Split(getItem(item, "i_iconRaw"),",")
	if (#tempiconRawRaw > 1) then
		info.iconRaw = tempiconRawRaw[1]
		info.iconRawOrigin = Vector2(tonumber(tempiconRawRaw[2]), tonumber(tempiconRawRaw[3]))
		info.iconRawSize = Vector2(tonumber(tempiconRawRaw[4]), tonumber(tempiconRawRaw[5]))
	else
		info.iconRaw = ""
		info.iconRawOrigin = Vector2.zero
		info.iconRawSize = Vector2.zero
	end
	
	info.i_add = tonumber(getItem(item, "i_add")) or 0
	info.i_bigSize = tonumber(getItem(item, "i_bigSize")) or 0
	info.i_bottom = tonumber(getItem(item, "i_bottom")) or 0
	info.i_cash = tonumber(getItem(item, "i_cash")) or 0
	info.i_consumeHP = tonumber(getItem(item, "i_consumeHP")) or 0
	info.i_consumeMP = tonumber(getItem(item, "i_consumeMP")) or 0
	info.i_create = tonumber(getItem(item, "i_create")) or 0
	info.i_cursed = tonumber(getItem(item, "i_cursed")) or 0
	info.i_direction = tonumber(getItem(item, "i_direction")) or 0
	info.i_dropSweep = tonumber(getItem(item, "i_dropSweep")) or 0
	info.i_effect = getItem(item, "i_effect")
	info.i_floatType = tonumber(getItem(item, "i_floatType")) or 0
	local tempiconD = _UtilLogic:Split(getItem(item, "i_iconD"),",")
	if (#tempiconD > 1) then
		info.iconD = tempiconD[1]
		info.iconDOrigin = Vector2(tonumber(tempiconD[2]), tonumber(tempiconD[3]))
		info.iconDSize = Vector2(tonumber(tempiconD[4]), tonumber(tempiconD[5]))
	else
		info.iconD = ""
		info.iconDOrigin = Vector2.zero
		info.iconDSize = Vector2.zero
	end
	local tempiconRawD = _UtilLogic:Split(getItem(item, "i_iconRawD"),",")
	if (#tempiconRawD > 1) then
		info.iconRawD = tempiconRawD[1]
		info.iconRawDOrigin = Vector2(tonumber(tempiconRawD[2]), tonumber(tempiconRawD[3]))
		info.iconRawDSize = Vector2(tonumber(tempiconRawD[4]), tonumber(tempiconRawD[5]))
	else
		info.iconRawD = ""
		info.iconRawDOrigin = Vector2.zero
		info.iconRawDSize = Vector2.zero
	end
	info.iconReward = getItem(item, "i_iconReward")
	info.i_incACC = tonumber(getItem(item, "i_incACC")) or 0
	info.i_incDEX = tonumber(getItem(item, "i_incDEX")) or 0
	info.i_incEVA = tonumber(getItem(item, "i_incEVA")) or 0
	info.i_incINT = tonumber(getItem(item, "i_incINT")) or 0
	info.i_incJump = tonumber(getItem(item, "i_incJump")) or 0
	info.i_incLUK = tonumber(getItem(item, "i_incLUK")) or 0
	info.i_incMAD = tonumber(getItem(item, "i_incMAD")) or 0
	info.i_incMDD = tonumber(getItem(item, "i_incMDD")) or 0
	info.i_incMHP = tonumber(getItem(item, "i_incMHP")) or 0
	info.i_incMMP = tonumber(getItem(item, "i_incMMP")) or 0
	info.i_incPAD = tonumber(getItem(item, "i_incPAD")) or 0
	info.i_incPDD = tonumber(getItem(item, "i_incPDD")) or 0
	info.i_incSpeed = tonumber(getItem(item, "i_incSpeed")) or 0
	info.i_incSTR = tonumber(getItem(item, "i_incSTR")) or 0
	info.i_left = tonumber(getItem(item, "i_left")) or 0
	info.i_life = tonumber(getItem(item, "i_life")) or 0
	info.i_longRange = tonumber(getItem(item, "i_longRange")) or 0
	info.i_masterLevel = tonumber(getItem(item, "i_masterLevel")) or 0
	info.i_mcType = tonumber(getItem(item, "i_mcType")) or 0
	info.i_meso = tonumber(getItem(item, "i_meso")) or 0
	info.i_mob = tonumber(getItem(item, "i_mob")) or 0
	info.i_noFlip = getItem(item, "i_noFlip")
	info.i_notSale = tonumber(getItem(item, "i_notSale")) or 0
	info.i_only = tonumber(getItem(item, "i_only")) or 0
	info.i_path = getItem(item, "i_path")
	info.i_pickupAll = tonumber(getItem(item, "i_pickupAll")) or 0
	info.i_pickUpBlock = tonumber(getItem(item, "i_pickUpBlock")) or 0
	info.i_pickupItem = tonumber(getItem(item, "i_pickupItem")) or 0
	info.i_price = tonumber(getItem(item, "i_price")) or 0
	info.i_quest = tonumber(getItem(item, "i_quest")) or 0
	info.i_rate = tonumber(getItem(item, "i_rate")) or 0
	info.i_recoveryHP = tonumber(getItem(item, "i_recoveryHP")) or 0
	info.i_recoveryMP = tonumber(getItem(item, "i_recoveryMP")) or 0
	info.i_reqLevel = tonumber(getItem(item, "i_reqLevel")) or 0
	info.i_reqSkillLevel = tonumber(getItem(item, "i_reqSkillLevel")) or 0
	info.i_right = tonumber(getItem(item, "i_right")) or 0
	info.i_sample = getItem(item, "i_sample")
	info.i_showMessage = tonumber(getItem(item, "i_showMessage")) or 0
	info.i_skill = getItem(item, "i_skill")
	info.i_slotMax = tonumber(getItem(item, "i_slotMax")) or 0
	info.i_speed = tonumber(getItem(item, "i_speed")) or 0
	info.i_stateChangeItem = tonumber(getItem(item, "i_stateChangeItem")) or 0
	info.i_success = tonumber(getItem(item, "i_success")) or 0
	info.i_timeLimited = tonumber(getItem(item, "i_timeLimited")) or 0
	info.i_top = tonumber(getItem(item, "i_top")) or 0
	info.i_tradeBlock = tonumber(getItem(item, "i_tradeBlock")) or 0
	info.i_type = tonumber(getItem(item, "i_type")) or 0
	info.i_unitPrice = tonumber(getItem(item, "i_unitPrice")) or 0
	info.s__0 = tonumber(getItem(item, "s_0")) or 0
	info.s__1 = tonumber(getItem(item, "s_1")) or 0
	info.s__2 = tonumber(getItem(item, "s_2")) or 0
	info.s__3 = tonumber(getItem(item, "s_3")) or 0
	info.s__4 = tonumber(getItem(item, "s_4")) or 0
	info.s_acc = tonumber(getItem(item, "s_acc")) or 0
	info.s_consumeOnPickup = tonumber(getItem(item, "s_consumeOnPickup")) or 0
	info.s_cp = tonumber(getItem(item, "s_cp")) or 0
	info.s_curse = tonumber(getItem(item, "s_curse")) or 0
	info.s_darkness = tonumber(getItem(item, "s_darkness")) or 0
	info.s_eva = tonumber(getItem(item, "s_eva")) or 0
	info.s_hp = tonumber(getItem(item, "s_hp")) or 0
	info.s_hpR = tonumber(getItem(item, "s_hpR")) or 0
	info.s_inc = tonumber(getItem(item, "s_inc")) or 0
	info.s_incFatigue = tonumber(getItem(item, "s_incFatigue")) or 0
	info.s_jump = tonumber(getItem(item, "s_jump")) or 0
	info.s_mad = tonumber(getItem(item, "s_mad")) or 0
	info.s_mdd = tonumber(getItem(item, "s_mdd")) or 0
	info.s_mesoupbyitem = tonumber(getItem(item, "s_mesoupbyitem")) or 0
	info.s_morph = tonumber(getItem(item, "s_morph")) or 0
	info.s_moveTo = tonumber(getItem(item, "s_moveTo")) or 0
	info.s_mp = tonumber(getItem(item, "s_mp")) or 0
	info.s_mpR = tonumber(getItem(item, "s_mpR")) or 0
	info.s_nuffSkill = tonumber(getItem(item, "s_nuffSkill")) or 0
	info.s_pad = tonumber(getItem(item, "s_pad")) or 0
	info.s_party = tonumber(getItem(item, "s_party")) or 0
	info.s_pdd = tonumber(getItem(item, "s_pdd")) or 0
	info.s_poison = tonumber(getItem(item, "s_poison")) or 0
	info.s_seal = tonumber(getItem(item, "s_seal")) or 0
	info.s_speed = tonumber(getItem(item, "s_speed")) or 0
	info.s_thaw = tonumber(getItem(item, "s_thaw")) or 0
	info.s_time = tonumber(getItem(item, "s_time")) or 0
	info.s_weakness = tonumber(getItem(item, "s_weakness")) or 0
	info.s_npc = tonumber(getItem(item, "s_npc")) or 0
	info.s_script = getItem(item, "s_script")
	info.s_expBuff = tonumber(getItem(item, "s_expBuff")) or 0
  	info.i_sweepForDrop = tonumber(getItem(item, "i_sweepForDrop")) or 0
  	info.i_hungry = tonumber(getItem(item, "i_hungry")) or 0
	self._iconRawAnimations[info.ItemId] = _AnimationMan:MakeSingleAnimation(info.iconRaw, info.iconRawSize, info.iconRawOrigin)
	return info
end

if (_Items:IsEquip(itemId)) then
	local info = loadEquip(row)
	if (info) then
		self._equips[itemId] = info
		return info
	end
else
	local info = loadItem(row)
	if (info) then
		self._items[itemId] = info
		return info
	end
end
return nil
end