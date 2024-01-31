return function (self,fadeInAnimation) 
local mob = self.Entity
local template = _MobTemplateMan:GetMobTemplate(self.MobTemplateID)

local function activateMobTrigger()
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
	mob.TriggerComponent.Enable = true
	local turn = false
	local tweener = _TweenLogic:MakeTween(0, 1, 1, EaseType.Linear, function(val)
		color.a = val
	end)
	tweener:SetOnEndCallback(activateMobTrigger)
	tweener:Play()
	self.FadeInTweener = tweener
else
	mob.TriggerComponent.Enable = true
	activateMobTrigger()
	_UpdateComponentLogic:InsertUpdateVisible(mob)
end
end