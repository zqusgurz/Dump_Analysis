return function (self,mob,attackIndex,target,left) 
if (mob.AttackTimer > 0) then
	_TimerService:ClearTimer(mob.AttackTimer)
	mob.AttackTimer = 0
end
if (not isvalid(mob) or mob.DeadType ~= -1) then
	return
end

---@type MobTemplate
local template = mob.Template
---@type MobAttackInfo
local attack = template.Attacks[attackIndex]
local p = _UserService.LocalPlayer

local m = mob.Entity
local mp = m.TransformComponent.WorldPosition:Clone()
local templateId = mob:GetLinkOriginTemplateId()

local attackFunc = nil
local effectFunc = nil
if (attack.Effect) then
	effectFunc = function()
		if (not isvalid(mob) or mob.DeadType ~= -1) then
			return
		end
		local effectUOL = string.format("Mob/%07d.img/attack%d/info/effect", templateId, attackIndex)
		local effect = _UidMan:GetAnimation(effectUOL)
		if (not _UtilLogic:IsNilorEmptyString(effect)) then		
            --mob.AttackEffectSN = _EffectService:PlayEffectAttached(effect, m, Vector3.zero, 0, Vector3.one, false, {
            --    FlipX = not left
            --})
			local ret = p.EffectDisplayerComponent:PlayEffect(effectUOL, m, Vector3.zero, left, false, function()
				mob.AttackEffectSN = nil
			end)
			if (type(ret) ~= "number") then			
				mob.AttackEffectSN = ret
			end
		else
			log_error("no attack effect", string.format("Mob/%07d.img/attack%d/info/effect", templateId, attackIndex))
		end
	end
end

local ms = _EffectLogic.SoundMob[templateId]
if (ms) then
	local sound = ms[string.format("Attack%d", attackIndex)]
	-- local sound = _UidMan:Get(string.format("Sound/Mob.img/%07d/Attack%d", mob.MobTemplateID, attackIndex))
	if (not _UtilLogic:IsNilorEmptyString(sound)) then
		_SoundService:PlaySoundAtPos(sound, m.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
	end
end

if (attack.Type == 0) then
	p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 0, os.clock())
	local toc, tos = _NumberUtils:GetTriggerBoxFromLtRb(attack.Lt, attack.Rb, left)
	attackFunc = function()
		if (not isvalid(mob) or mob.DeadType ~= -1) then
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, -1, os.clock())
			return
		end
		local mobPos = m.TransformComponent.WorldPosition:ToVector2()
		local box = BoxShape(mobPos + toc, tos, 0)
		if (_EntityUtils:IsTargetInBox(m, box, p) and (not attack.JumpAttack or p.RigidbodyComponent:IsOnGround())) then
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 1, os.clock())
			p.PlayerHitComponent:HitByAttack(m, attackIndex, attack)
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 2, os.clock())
		else
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 3, os.clock())
		end
	end
elseif (attack.Type == 1) then
	p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 0, os.clock())
	if (target == p) then
		attackFunc = function()
			if (not isvalid(mob) or mob.DeadType ~= -1) then
				p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, -1, os.clock())
				return
			end
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 1, os.clock())
			local pp = p.TransformComponent.WorldPosition
			local st = p.StateComponent.CurrentStateName
			p.PlayerHitComponent:Validate(st, mp, left, mob, attackIndex, pp)
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 2, os.clock())
		end
	end
elseif (attack.Type == 2) then
	local targetPos = target.TransformComponent.WorldPosition:ToVector2()
	local targetState = target.StateComponent.CurrentStateName
	local bc, bs = _CharacterActionLogic:GetBodyRect(targetState == "PRONE" or targetState == "PRONESTAB")
	p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 0, os.clock())
	local ep = targetPos:Clone()
	if (target.WsUserController.LookDirectionX == 1) then
		ep.x -= bc.x
	else
		ep.x += bc.x
	end
	-- ep.y += attack.Sp.y
	ep.y += bc.y
	attackFunc = function()
		if (not isvalid(mob) or mob.DeadType ~= -1) then
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, -1, os.clock())
			return
		end
		local mobPos = m.TransformComponent.WorldPosition:ToVector2()
		local sp = mobPos
		if (targetPos.x < mobPos.x) then -- left
			sp.x += attack.Sp.x
		else
			sp.x -= attack.Sp.x
		end
		sp.y += attack.Sp.y
		local ball = _UidMan:GetAnimation(string.format("Mob/%07d.img/attack%d/info/ball", templateId, attackIndex))
		if (not _UtilLogic:IsNilorEmptyString(ball)) then
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 1, os.clock())
			_UserService.LocalPlayer.EffectDisplayerComponent:RegisterMobAttackBall(ball, sp, ep, left, m, attackIndex, attack)
			p.PlayerHitComponent:SendMobAttackStepAck(m, attackIndex, 2, os.clock())
		else
			log_error("no ball effect", string.format("Mob/%07d.img/attack%d/info/ball", templateId, attackIndex))
		end
	end
end

if (effectFunc) then
	if (attack.EffectAfter > 0) then
		mob.AttackEffectTimer = _TimerService:SetTimerOnce(effectFunc, attack.EffectAfter)
	else
		effectFunc()
	end
end
if (attackFunc) then
	if (attack.AttackAfter > 0) then
		mob.AttackTimer = _TimerService:SetTimerOnce(attackFunc, attack.AttackAfter)
	else
		attackFunc()
	end
end
end