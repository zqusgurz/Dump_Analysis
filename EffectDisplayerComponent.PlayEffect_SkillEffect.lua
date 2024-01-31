return function (self,skillId,sub,except) 
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return
end
if (_UserService.LocalPlayer.OwnerId == except) then
	return
end
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	return
end

if (skillId == _Skills.SWORDMAN_IRON_BODY or skillId == _Skills.MAGICIAN_MAGIC_ARMOR) then
	local avatar = self:GetOverAvatarEffectLayer("IronBody", true)
	local t = avatar.TransformComponent
	local ar = avatar.AvatarRendererComponent
	local r = self.Entity.WsUserController.LookDirectionX
	local sign = -(r / math.abs(r)) -- 왼쪽:1 오른쪽-1
	t.Scale.x = sign
	t.Scale.y = 1
	ar:SetAlpha(0.83)
	_PlayerActiveSkillLogic:PlaySkillAction(self.Entity, skillId, except, ar, "IronBody")
	local tweener = _TweenLogic:MakeTween(0, 1, 0.4, EaseType.Linear, function(val)
		avatar.Visible = true
		ar:SetAlpha(0.83 * (1 - val))
		t.Scale.x = (1 + (val * 2)) * sign
		t.Scale.y = 1 + (val * 2)
	end)
	tweener.AutoDestroy = true
	tweener:SetOnEndCallback(function()
		avatar.Visible = false		
	end)
	tweener:Play()
end

self:_PlayEffect(skill:GetEffect(sub), "Skill/%03d.img/skill/%07d/effect%s", sub, skillId)
local effect0 = skill:GetEffect("0")
if (effect0 ~= nil) then
	self:_PlayEffect(effect0, "Skill/%03d.img/skill/%07d/effect%s", "0", skillId)
end
end