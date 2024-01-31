return function (self,summonType,mobId,hasRegenFadeInAnimation,statTable,parent) 
self.MobTemplateID = mobId
self:ResetMob()
local mob = self.Entity
mob.Visible = false
local template = _MobTemplateMan:GetMobTemplate(mobId)
self.Entity.MobTemporaryStat:DownloadTemporaryStatSet(statTable)

if (summonType == _MobSummonType.Regen) then
	if (hasRegenFadeInAnimation) then
		self:OnRegen(true)
	end
elseif (summonType == _MobSummonType.Normal) then
	self:OnRegen(false)
elseif (summonType == _MobSummonType.Revive) then
	if (not isvalid(parent) or not parent.Visible) then
		self:OnRegen(false)
	else
		local eventHandler = parent:ConnectEvent(ShowReviveEvent, function()
			self:OnRegen(false)
			self:DisconnectShowReviveEvent()
		end)
		self.ShowReviveEventHandler = eventHandler
		self.ShowReviveParent = parent
	end
else
	local p = _UserService.LocalPlayer
	local pos = mob.TransformComponent.WorldPosition:Clone()
	local ed = p.EffectDisplayerComponent
	local uol = string.format("Effect/Summon.img/%d", summonType)
	local delayCtx = _EffectLogic.SummonEffectDelay[uol]
	local function showMob()
		mob.Visible = true
		self:OnRegen(false)
		local sound = _UidMan:Get(string.format("Sound/Summon.img/%d", summonType))
		if (not _UtilLogic:IsNilorEmptyString(sound)) then
			_SoundService:PlaySoundAtPos(sound, pos, p, 1)
		end
	end
	if (delayCtx.Total == delayCtx.Delay) then
		ed:PlayEffect(uol, nil, pos, true, false, showMob)
	else
		ed:PlayEffect(uol, nil, pos, true, false, nil)
		_TimerService:SetTimerOnce(showMob, delayCtx.Delay)
	end
end
-- self:ChangeAnimationByState(mob.StateComponent.CurrentStateName)
end