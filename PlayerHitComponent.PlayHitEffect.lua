return function (self,templateId,attackIndex,left) 
if (templateId > 0 and attackIndex > 0) then
	local p = self.Entity
	
	local hitEffectUOL = string.format("Mob/%07d.img/attack%d/info/hit", templateId, attackIndex)
	local hitEffect = _UidMan:GetAnimation(hitEffectUOL)
	if (not _UtilLogic:IsNilorEmptyString(hitEffect)) then
		local pPos = p.TransformComponent.WorldPosition:Clone()
		
		local template = _MobTemplateMan:GetMobTemplate(templateId)
		---@type MobAttackInfo
		local attack = template.Attacks[attackIndex]
		if (attack) then
			local s = p.StateComponent.CurrentStateName
			local rectP, rectS = _CharacterActionLogic:GetBodyRect(s == "PRONE" or s == "PRONESTAB")
			if (attack.HitAttach) then
				p.EffectDisplayerComponent:PlayEffect(hitEffectUOL, p, Vector3.zero, left, false, nil)
			elseif (attack.Type == 2) then
				pPos.x += rectP.x + (rectS.x / 2)
				pPos.y += rectP.y + (rectS.y / 2)
				p.EffectDisplayerComponent:PlayEffect(hitEffectUOL, nil, pPos, left, false, nil)
			else
				local px = _GlobalRand32:RandomDouble() * (rectS.x / 2)
				local py = _GlobalRand32:RandomDouble() * (rectS.y / 2)
				pPos.x += px
				pPos.y += py
				p.EffectDisplayerComponent:PlayEffect(hitEffectUOL, nil, pPos, left, false, nil)
			end
		end
		
		
	else
		-- log_error("no hit effect", string.format("Mob/%07d.img/attack%d/info/hit", templateId, attackIndex))
	end
	
	if (p == _UserService.LocalPlayer) then
		local ms = _EffectLogic.SoundMob[templateId]
		if (ms) then
			local hitSound = ms[string.format("CharDam%d", attackIndex)]
			if (not _UtilLogic:IsNilorEmptyString(hitSound)) then
				_SoundService:PlaySoundAtPos(hitSound, p.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
			end
		end
	end
end
end