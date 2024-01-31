return function (self,startPt,endPt,target,targetHitOffset,actionDelay,skillId,skillLevel,bulletItemId,left,ballBullet,soulArrow,bulletSpeed) 
if (_PlayerAttackLogic_Shoot:IsShootSkillNotShowingBullet(skillId)) then
	return
end

local distance = startPt:Distance(endPt)
local ballUOL = nil
local ballAsset
local bulletCount = 1
---@type SkillInfo
local skill = nil
---@type SkillLevelData
local levelData = nil

if (skillId ~= 0) then
	skill = _SkillMan:GetSkill(skillId)
	levelData = skill:GetLevelData(skillLevel)
	if (levelData.bulletCount > 0) then
		bulletCount = levelData.bulletCount
	end
end

if (soulArrow > 0 and not ballBullet) then
	ballAsset = _EffectLogic.Bullet[-soulArrow]
	ballUOL = _SkillMan:GetSkill(soulArrow):GetBall()
else
	if (skillId ~= 0) then
		if (ballBullet) then
			ballUOL = skill:GetBall()
			if (ballUOL == nil) then
				ballUOL = levelData.ball
			end
		end
	end
	if (not ballBullet and bulletItemId ~= 0) then
		ballAsset = _EffectLogic.Bullet[bulletItemId]
        --if (ballAsset == nil) then
        --    log_error(string.format("BulletItem %d doesn't have bullet animation"))
        --    return
        --end
		ballUOL = _EffectLogic.BulletUOL[bulletItemId]
	end
end

if (ballUOL == nil) then
	log(string.format("skill %d(bullet:%d): no bullet UOL", skillId, bulletItemId))
	return
end

local bulletDelay = _PlayerAttackLogic_Shoot:GetBulletDelay(bulletItemId, skillId, 0)
local shootDelay = _PlayerAttackLogic_Shoot:GetShootDelay(skillId, actionDelay)

local sfxName = self.Entity.CharacterActionComponent.CurrentWeaponSfx
local sfxRUID = sfxName and _EffectLogic.SoundWeapon[sfxName]["Attack2"] or nil

for i=1,bulletCount do
	local delay = (i-1)*bulletDelay + shootDelay
	local duration = distance * bulletSpeed
	local fanShapeShootOffset = 0
	if (_PlayerActiveSkillLogic.ShootAttackSkills[skillId]) then
		fanShapeShootOffset = 0.07 * (2 * (i-1) - (bulletCount-1))
	end
	
	-- log(string.format("delay: %.2f  duration: %.2f", delay, duration), startPt, endPt)
	local map = _UserService.LocalPlayer.CurrentMap
	---@type table
	local pool
	---@type string
	local objName
	
	if (ballAsset ~= nil) then 
		pool = self.BulletPool_Anim[map.Id]
		if (pool == nil) then
			pool = {}
			self.BulletPool_Anim[map.Id] = pool
		end
		objName = "PooledBullet_Anim"
	else
		pool = self.BulletPool_UOL[map.Id]
		if (pool == nil) then
			pool = {}
			self.BulletPool_UOL[map.Id] = pool
		end
		objName = "PooledBullet_UOL"
	end
	
	local timer = -1
	local entity = _ObjectPool:PickEx(pool, objName, "model://a31c9746-fa4c-42ba-add5-509b08a9b73f", startPt:ToVector3(), map, false)
	local success,_ = pcall(function()
		local msp = entity.MapleSpriteRendererComponent
		if (ballAsset ~= nil) then 
			msp:SetAssetAnimation(ballAsset.Projectile, ballUOL)
		else
			msp:SetWzSprite(ballUOL, true)
		end
		
		local sp = msp:GetSpriteEntity().SpriteRendererComponent
		if (sp.SortingLayer == "") then
			sp.SortingLayer = "Player"
			sp.OrderInLayer = 2
		end
		entity.BulletComponent.ReturnPool = pool
		local user = self.Entity
		timer = _TimerService:SetTimerOnce(function()
			if (sfxRUID ~= nil) then
				_SoundService:PlaySoundAtPos(sfxRUID, startPt:ToVector3(), _UserService.LocalPlayer, 1)
			end
			local bc = entity.BulletComponent
			bc.LastFacingLeft = nil
			entity.TransformComponent.WorldZRotation = 0
			if (target == nil) then
				bc:SetBulletDirection(endPt.x < entity.TransformComponent.WorldPosition.x)
				bc.Enable = false
				endPt.y -= fanShapeShootOffset
				local tweener = _TweenLogic:MoveTo(entity, endPt, duration, EaseType.Linear)
				tweener:SetOnEndCallback(function()
					_ObjectPool:Release(bc.ReturnPool, entity)
				end)
			else
				bc.FanShapeShootOffset = fanShapeShootOffset
				bc.Target = target
				bc.TargetHitOffset = targetHitOffset:ToVector3()
				bc.Enable = true
			end
			entity.Enable = true
		end, delay)
	end)
	if (not success) then
		if (timer ~= -1) then
			_TimerService:ClearTimer(timer)
			_ObjectPool:Release(pool, entity)
		end
	end
end
end