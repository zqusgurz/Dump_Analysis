return function (self) 
local user = self.Entity
if (user.OwnerId ~= _UserService.LocalPlayer.OwnerId) then
	return
end
if (user.WsUser:IsDied()) then
	return
end
local ts = user.PlayerTemporaryStat
local movable = ts:GetValue(_CTS.Stun) == 0

if (movable ~= user.MovementComponent.Enable) then
	user.MovementComponent.Enable = movable
end
if (movable ~= user.PlayerControllerComponent.Enable) then
	user.PlayerControllerComponent.Enable = movable
end

if (movable) then
	if (user.WsUser:IsAvailablePlayerMovement() and user.MovementComponent.Enable) then
		if (_InputManager:IsPressed(_FuncKeySystemType.Attack)) then
			local darkSight = ts:GetValue(_CTS.DarkSight) > 0
			if (darkSight) then
				local reason = ts:GetReason(_CTS.DarkSight)
				_UserSkillLogic:TryCancelTemporaryStat(user, reason)
				_InputManager:MarkNoKeyInputFuncKey(_FuncKeyTypes.System, _FuncKeySystemType.Attack)
			else
				local currentState = user.StateComponent.CurrentStateName
				if (currentState ~= "SIT") then
					local shootAttack = _PlayerAttackLogic:CheckAvailableShootAttack(user, 0, 0)
					if (shootAttack) then
						local output = {}
						if (_PlayerAttackLogic_Melee:TryDoingMeleeAttack(user, 0, 0, output, 0, 0) == 0) then
							_PlayerAttackLogic_Shoot:TryDoingShootAttack(user, 0, 0, output.ShootRange, 0)
						end
					else
						_PlayerAttackLogic_Melee:TryDoingMeleeAttack(user, 0, 0, nil, 0, 0)
					end
				end
			end
		elseif (_InputManager:IsPressed(_FuncKeySystemType.Jump)) then
			local currentState = user.StateComponent.CurrentStateName
			self:TryJump(currentState)
		end
	end
	self:UpdateProne()
end



self:UpdateClimbableAvailable()
self:UpdateAlert()
end