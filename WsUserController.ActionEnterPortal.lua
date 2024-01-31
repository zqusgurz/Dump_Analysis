return function (self) 
if (not self:CheckLastRequestPortal()) then
	return
end
if (self.Entity.WsUser.ExclusiveAction) then
	return
end
if (not self.Entity.WsUser:IsAvailablePlayerMovement()) then
	return
end
if (not self.Entity.MovementComponent.Enable) then
	return
end

local pt = self._currentTriggeredPortal
if (pt ~= nil) then
	-- Visible, Invisible 일반 포탈
	if (pt.Pt == _PortalType.Visible or pt.Pt == _PortalType.Invisible
		or pt.Pt == _PortalType.Changable or pt.Pt == _PortalType.ChangableInvisible) then
		if (pt.Tm == "m999999999") then -- 더미 포탈
			return
		end
		-- 땅 위에서만..
		if (self.Entity.RigidbodyComponent:IsOnGround()) then
			self:TryEnterNormalPortal(pt)
		end
	elseif (pt.Pt == _PortalType.Script or pt.Pt == _PortalType.ScriptInvisible) then
		if (pt.Script == "") then
			return
		end
		-- 땅 위에서만..
		if (self.Entity.RigidbodyComponent:IsOnGround()) then
			-- 포탈 사용..
			self.Entity.WsUser.ExclusiveAction = true
			self.Entity.WsUser:UsePortal(pt)
		end
	end
end
end