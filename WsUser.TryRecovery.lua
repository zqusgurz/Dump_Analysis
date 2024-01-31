return function (self) 
local user = self.Entity
local state = user.StateComponent
local now = _UtilLogic.ElapsedSeconds
local option = 0
local shouldRecoveryHp = true
local shouldRecoveryMp = true
local currentState = state.CurrentStateName
if (currentState ~= "IDLE") then
	local cd = user.WsCharacterData
	if (_UserRecoveryLogic:CheckEndureOnRope(user, currentState)) then
		option = 1
	else
		shouldRecoveryHp = false
	end
	-- 줄 안타도 돚거 인듀어 효과가 반영되게끔 해야한다면 아래 주석 해제
--else
    --if (_Jobs:GetJobClass(user.WsCharacterData.Job) == 4) then
    --    local lastRestHpChanged = self.LastRestHpChanged[1] or 0
    --    local lastRestMpChanged = self.LastRestMpChanged[1] or 0
    --    if (lastRestHpChanged + _UserRecoveryLogic:GetHpRecoveryInterval(user, option) <= now) then
    --        if (lastRestMpChanged + _UserRecoveryLogic:GetMpRecoveryInterval(user, option) <= now) then
    --            option = 1
    --        end
    --    end
    --end
end
-- log("ShouldRecoveryHp:", shouldRecoveryHp, " ShouldRecoveryMp:", shouldRecoveryMp)
local hp = 0
local mp = 0
local lastRestHpChanged = self.LastRestHpChanged[option] or 0
local hpInterval = _UserRecoveryLogic:GetHpRecoveryInterval(user, option)
-- log("lastRestHpChanged:", lastRestHpChanged, "/option:", option,"/interval:",hpInterval,"/now:",now)
if (lastRestHpChanged + hpInterval <= now) then
	if (shouldRecoveryHp) then
		hp = _UserRecoveryLogic:GetHpRecovery(user, option)
	end
	-- log("current hp recovery:", hp)
	self.LastRestHpChanged[option] = now
end
local lastRestMpChanged = self.LastRestMpChanged[option] or 0
local mpInterval = _UserRecoveryLogic:GetMpRecoveryInterval(user, option)
-- log("lastRestMpChanged:", lastRestMpChanged, "/option:", option,"/interval:",mpInterval,"/now:",now)
if (lastRestMpChanged + mpInterval <= now) then
	if (shouldRecoveryMp) then
		mp = _UserRecoveryLogic:GetMpRecovery(user, option)	
	end
	-- log("current mp recovery:", mp)
	self.LastRestMpChanged[option] = now
end
if (hp > 0 or mp > 0) then
	if (user.WsUser:IsDied()) then
		return
	end
	if (option == 0 and hp > 0 and user.WsUser.MaxHp > user.WsUser.Hp) then
		local pos = user.TransformComponent.WorldPosition:Clone()
		user.EffectDisplayerComponent:Effect_HP(-hp, pos, false, 1, false)
	end
	-- log(string.format("stat change req  hp:%d  mp:%d", hp, mp))
	_UserRaiseLogic:OnStatChangeRequest(user, hp, mp, option)
end
end