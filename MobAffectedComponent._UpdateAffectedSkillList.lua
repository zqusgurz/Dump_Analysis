return function (self) 
local before = self.CurrentAffectedList
local beforeSkills = {}
for i=1,#before do
	beforeSkills[before[i].SkillId] = true
end

self:Clear()

local after = self:MakeAffectedSkillList()
self.CurrentAffectedList = after

local mobHue = Color.white

local headIcons = {}
local mobPosIcons = {}
local nonIconList = self.CurrentNonIconList

---@type MobAffectedSkillEntry
local playEffect = nil

for i=1,#after do
	---@type MobAffectedSkillEntry
	local entry = after[i]
	
	if (entry.MobEffectIsIcon and entry.MobEffectClip) then
		if (entry.MobEffectPos == 2) then
			--log(string.format("Entry %d is head icon", entry.SkillId))
			headIcons[#headIcons + 1] = entry
		else
			--log(string.format("Entry %d is mob pos icon", entry.SkillId))
			mobPosIcons[#mobPosIcons + 1] = entry
		end
	else
		-- repeat 이펙트들은 리스트에 넣어서 로테이션
		if (entry.MobEffectIsRepeat) then
			if (entry.MobEffectPos == 2) then
				self:EnsureMakeHeadGroup()
				entry.Entity = _ObjectPool:PickEx(self.HeadAnimationPool, "PooledHeadAnimation", "model://mapobject", Vector3.zero, self.HeadGroup, false)
			else
				entry.Entity = _ObjectPool:PickEx(self.MobAnimationPool, "PooledMobPosAnimation", "model://mapobject", Vector3.zero, self.Entity, false)
			end
			nonIconList[#nonIconList + 1] = entry
			entry.Entity.TransformComponent.Position = Vector3.zero
			if (entry.MobEffectPos == 3) then -- 몬스터 정 중앙 위치
				entry.Entity.TransformComponent.Position.y += (self:GetMobHeight() / 2)
			end
			entry.Entity.SpriteRendererComponent.SpriteRUID = entry.MobEffectClip
		-- repeat 아닌건 한번 재생하고 끝낼거
		else
			-- 이전에 안걸려있던 스킬만
			if (not beforeSkills[entry.SkillId]) then
				playEffect = entry			
			end
		end
		
	end
	
	local mobSkillEffect = _MobSkill.AffectedSkillEffect[entry.SkillId]
	if (mobSkillEffect) then
		mobHue = mobSkillEffect.Color
	end
end

if (playEffect and playEffect.MobEffectClip) then
	local sp = self.Entity.SpriteRendererComponent
	local sortingLayer = sp.SortingLayer
	if (playEffect.MobEffectPos == 2) then
		self:EnsureMakeHeadGroup()
		_EffectService:PlayEffectAttached(playEffect.MobEffectClip, self.HeadGroup, Vector3.zero, 0, Vector3.one, false, {
			["SortingLayer"] = sortingLayer,
			["FlipX"] = sp.FlipX,
			["OrderInLayer"] = 3
		})
	else
		local pos = Vector3.zero
		if (playEffect.MobEffectPos == 3) then -- 몬스터 정 중앙 위치
			pos.y += (self:GetMobHeight() / 2)
		end
		_EffectService:PlayEffectAttached(playEffect.MobEffectClip, self.Entity, pos, 0, Vector3.one, false, {
			["SortingLayer"] = sortingLayer,
			["FlipX"] = sp.FlipX,
			["OrderInLayer"] = 3
		})
	end
end

-- 색조 조정 (투명도 값 제외)
local color = self.Entity.SpriteRendererComponent.Color
color.b = mobHue.b
color.r = mobHue.r
color.g = mobHue.g
-- log("Changed to mob color:", color)

-- 아이콘들 위치 재설정
---@param iconsTable table<MobAffectedSkillEntry>
local function showIcons(iconsTable, pool, parent)
	local iconNum = #iconsTable
	--log(string.format("Displaying %d icons (parent:%s/pool:%s)", iconNum, tostring(parent), tostring(pool)))
	if (iconNum == 0) then
		return
	end
	local remainder = iconNum % 4
	local totalRow = (iconNum // 4) + 1
	
	local function showRow(maxColumn, curRow)
		local beginX = -0.08 * (maxColumn - 1)
		local beginIndex = 0
		if (remainder > 0) then
			if (curRow == 1) then
				beginIndex = 0
			elseif (curRow == 2) then
				beginIndex = remainder
			else
				beginIndex = remainder + (curRow - 2) * 4
			end
		else
			beginIndex = (curRow - 1) * 4
		end
		for i=1,maxColumn do
			local entry = iconsTable[beginIndex + i]
			local x = beginX + 0.16 * (i - 1)
			local y = (totalRow - curRow) * 0.16
			local icon = _ObjectPool:Pick(pool, "PooledIcon", "model://mapobject", Vector3(-10000, -10000, 0), parent)
			icon.TransformComponent.Position = Vector3(x, y, 0)
			icon.SpriteRendererComponent.SpriteRUID = entry.MobEffectClip
			entry.Entity = icon
			--log(string.format("displaying icon x:%.2f y=%.2f  clip=%s", x, y, entry.MobEffectClip))
		end
	end
	
	for i=1,totalRow do
		if (i == 1 and remainder > 0) then
			showRow(remainder, i)
		else
			showRow(4, i)
		end
	end
end

if (#headIcons > 0) then
	self:EnsureMakeHeadGroup()
	showIcons(headIcons, self.HeadAnimationPool, self.HeadGroup)
end
if (#mobPosIcons > 0) then
	showIcons(mobPosIcons, self.MobAnimationPool, self.Entity)
end

-- 로테이션 타이머 재시작
   -- 0.66초마다 인덱스 1부터 로테이션.
   -- * repeat가 아닐 경우, 다음에 읽는 인덱스는 1로 설정되고, 리스트에서 이펙트 삭제.
if (#self.CurrentNonIconList > 0) then
	self.RotationNonIconTimer = _TimerService:SetTimerRepeat(self.NextRotationNonIconEffect, 0.66)
end

local hasPoison = false
local mts = self.Entity.MobTemporaryStat
if (not hasPoison and mts:GetValue(_MTS.Poison) > 0) then
	hasPoison = true
end

self:SetPoisonTimer(hasPoison)
end