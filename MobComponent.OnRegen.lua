return function (self,fadeInAnimation) 
local mob = self.Entity
local template = _MobTemplateMan:GetMobTemplate(self.MobTemplateID)

local function activateMobTrigger()
	mob.TriggerComponent.Enable = true
	
	local enabledBodyAttack
	if (template.BodyAttack and not template.NotAttack) then
		enabledBodyAttack = true
	else
		enabledBodyAttack = false
	end
	self:SetBodyAttackEnabled(enabledBodyAttack)
	self:UpdateTriggerBoxByState(self.Entity.StateComponent.CurrentStateName)
	self:ClearFadeInTweener()
	mob.SpriteRendererComponent.Color.a = 1
end

if (fadeInAnimation) then
	self:ClearFadeInTweener()
	local color = mob.SpriteRendererComponent.Color
	color.a = 0
	_UpdateComponentLogic:InsertUpdateVisible(mob)
	local turn = false
	local tweener = _TweenLogic:MakeTween(0, 1, 1, EaseType.Linear, function(val)
		color.a = val
		if (not turn and val >= 0.4) then
			activateMobTrigger()
			turn = true
		end
	end)
	tweener:Play()
	self.FadeInTweener = tweener
else
	activateMobTrigger()
	_UpdateComponentLogic:InsertUpdateVisible(mob)
end
end