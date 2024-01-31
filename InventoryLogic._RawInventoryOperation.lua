return function (self,cd,changeLog) 
local changedAvatar = false
local changedModFlags = 0

local function tryUpdateActiveBulletPos(TI, pos1, pos2)
	if (self:IsClient()) then
		if (TI ~= 2) then return end
		
		local function check(pos)
			if (pos) then
				local changedItem = cd:GetItem(TI, pos)
				if (changedItem ~= nil) then
					return _Items:IsRechargable(changedItem.ItemId) or _Items:IsArrow(changedItem.ItemId) or _Items:IsCrossbowArrow(changedItem.ItemId)
				end
			end
			return false
		end
		
		if (check(pos1) or check(pos2)) then
			self:UpdateActiveBullet(pos1, pos2)
		end
	end
end

local additionalChangeLog = {}
for _,_l in ipairs(changeLog) do
	---@type InventoryOperation
	local log = _l
	local logTI = log.TI
	local logPosition = log.Position
	local logArgument = log.Argument[1]
	if (logTI == 1) then
		changedModFlags |= _CharacterDataFlag.ItemSlotEqp
	elseif (logTI == 2) then
		changedModFlags |= _CharacterDataFlag.ItemSlotCon
	elseif (logTI == 3) then
		changedModFlags |= _CharacterDataFlag.ItemSlotIns
	elseif (logTI == 4) then
		changedModFlags |= _CharacterDataFlag.ItemSlotEtc
	elseif (logTI == 5) then
		changedModFlags |= _CharacterDataFlag.ItemSlotCash
	end
	if (log.Type == _ChangeLogType.Added) then
		---@type ItemSlotBase
		local newItem = logArgument
		self:RawSetItem(cd, logTI, logPosition, newItem)
		if (logPosition < 0 and _Items:IsEquip(newItem.ItemId)) then
			if (self:IsServer()) then
				self:OnEquipped(cd, logTI, logPosition, logArgument, additionalChangeLog)
				changedAvatar = true
			end
		end
		if (self:IsClient()) then
			tryUpdateActiveBulletPos(logTI, logPosition, nil)
			self:InvalidateItemSlot(logTI, logPosition)
			self:CheckUpdateItemNoKeyConfig(newItem.ItemId)
			_LocalQuestMon:CheckItemQuestDemand(newItem.ItemId)
		end
	elseif (log.Type == _ChangeLogType.Number) then
		---@type ItemSlotBase
		local item = self:RawGetItem(cd, logTI, logPosition) 
		if (item ~= nil and not _Items:IsEquip(item.ItemId)) then
			item.Number = log.Number
			if (self:IsClient()) then
				tryUpdateActiveBulletPos(logTI, logPosition, nil)
				self:InvalidateItemSlot(logTI, logPosition)
				self:CheckUpdateItemNoKeyConfig(item.ItemId)
				_LocalQuestMon:CheckItemQuestDemand(item.ItemId)
			end
		end
	elseif (log.Type == _ChangeLogType.Position) then
		local t = self:RawGetItem(cd, logTI, logArgument)
		if ((logPosition < 0) ~= (logArgument < 0)) then
			local equipItem, invenItem, invenPos, equipPos
			if (logPosition < 0) then
				equipItem = self:RawGetItem(cd, logTI, logPosition) 
				invenItem = self:RawGetItem(cd, logTI, logArgument)
				invenPos = logArgument
				equipPos = logPosition
			else
				equipItem = self:RawGetItem(cd, logTI, logArgument)
				invenItem = self:RawGetItem(cd, logTI, logPosition) 
				invenPos = logPosition
				equipPos = logArgument
			end
			if (self:IsServer()) then
				-- OnUnequipped
				if (invenItem) then
					self:OnEquipped(cd, logTI, equipPos, invenItem, additionalChangeLog)
				end
				changedAvatar = true
			end
		end
		local previous = self:RawGetItem(cd, logTI, logPosition)
		self:RawSetItem(cd, logTI, logArgument, previous)
		self:RawSetItem(cd, logTI, logPosition, t)
		if (self:IsClient()) then
			tryUpdateActiveBulletPos(logTI, logArgument, logPosition)
			self:InvalidateItemSlot(logTI, logArgument)
			self:InvalidateItemSlot(logTI, logPosition)
		end
	elseif (log.Type == _ChangeLogType.Removed) then
		local item = self:RawGetItem(cd, logTI, logPosition)
		if (item ~= nil) then
			if (_Items:IsEquip(item.ItemId)) then
				if (logPosition < 0) then
					if (self:IsServer()) then
						-- OnUnequipped
						changedAvatar = true
					end
				end
			end
		end
		self:RawSetItem(cd, logTI, logPosition, nil)
		if (self:IsClient()) then
			local isConsumeBullet = _Items:IsRechargable(item.ItemId) or _Items:IsArrow(item.ItemId) or _Items:IsCrossbowArrow(item.ItemId)
			if (item ~= nil and isConsumeBullet) then
				self:UpdateActiveBullet(logPosition, -1)
			end
			self:InvalidateItemSlot(logTI, logPosition)
			if (item ~= nil) then
				self:CheckUpdateItemNoKeyConfig(item.ItemId)
			end
			_LocalQuestMon:CheckItemQuestDemand(item.ItemId)
		end
	end
end
if (self:IsServer()) then
	cd.ChangedDataFlag |= changedModFlags
	if (changedAvatar) then
		cd.Entity.WsUser:ValidateStat()
	end
	if (#additionalChangeLog > 0) then
		table.move(additionalChangeLog, 1, #additionalChangeLog, #changeLog + 1, changeLog)
	end
end
end