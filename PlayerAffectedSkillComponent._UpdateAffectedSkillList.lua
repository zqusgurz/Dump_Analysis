return function (self,silent) 
---@type table<PlayerAffectedSkillEntry>
local beforeList = self.AffectedList

for i=1,#beforeList do
	self:ReleaseEntry(beforeList[i])
end

--[[
    1. CTS로 먼저 선택
    2. 같은 Reason이 있다면 유지
    3. 새로운 리스트에 없는 Entry 삭제
]]

local newAffectedList = {}
local newStats = {}
local ts = self.Entity.PlayerTemporaryStat
local function findReason(cts)
	if (ts:GetValue(cts) ~= 0) then
		local reason = ts:GetReason(cts)
		for i=1,#beforeList do
			local beforeEntry = beforeList[i]
			-- 기존에 이미 있던 Entry
			if (beforeEntry.Skill == reason) then
				newAffectedList[#newAffectedList + 1] = beforeEntry
				return
			end
		end
		newStats[#newStats + 1] = reason
	end
end

for k,_ in pairs(_UserAffectedEffects.List) do
	findReason(k)
end

local notifications = {}

for i=1,#newStats do
	local newStat = newStats[i]
	---@type PlayerAffectedSkillEntry
	local entry = nil
	---@type SkillInfo
	local userSkillInfo = _SkillMan:GetSkill(newStat)
	if (userSkillInfo) then
		-- TODO
	else
		local msId, msLv = _MobSkill:Tear(newStat)
		local mobSkillInfo = _SkillMan:GetMobSkillLevelData(msId, msLv)
		local affected = mobSkillInfo.AffectedEffect
		if (affected) then
			entry = {}
			entry.Uol = string.format("Skill/MobSkill.img/%d/level/%d/affected", msId, msLv)
			entry.Pos = affected.pos
			entry.Skill = newStat
		end
		if (self.Entity == _UserService.LocalPlayer) then
			local notify = _MobSkill.Notification[msId]
			if (notify) then
				notifications[#notifications + 1] = notify
			end
		end
	end
	
	if (entry) then
		table.insert(newAffectedList, 1, entry)
	end
end

self.AffectedList = newAffectedList

if (self.RotationUpdateTimer > 0) then
	_TimerService:ClearTimer(self.RotationUpdateTimer)
	self.RotationUpdateTimer = 0
end
self.CurrentRotationIndex = 0

if (#newAffectedList > 1) then
	self.RotationUpdateTimer = _TimerService:SetTimerRepeat(function()
		self:DoRotation()
	end, 1.32)
elseif (#newAffectedList == 1) then
	self:DoRotation()
end

if (not silent) then
	for i=1,#notifications do
		_ChatMessageLogic:Add(_ChatMessageType.System, notifications[i])
	end
end
end