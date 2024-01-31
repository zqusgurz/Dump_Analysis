return function (self,user) 
local uc = user.WsUserController
local camera = user.CameraComponent
---@type TeleportInfo
local teleport = uc.Teleport
if (teleport ~= nil) then
	local now = _UtilLogic.ElapsedSeconds
	if (teleport.Valid) then
		if (teleport.Start <= now) then
			local pos = user.TransformComponent.WorldPosition:Clone()
			camera.SoftZone.x = math.max(0.5, math.min(10, 0.1 + math.abs(teleport.Position.x - pos.x)))
			camera.SoftZone.y = math.max(0.75, math.min(10, 0.1 + math.abs(teleport.Position.y - pos.y)))
			if (teleport.ByPortal) then
				camera.Damping.x = 0.45
				camera.Damping.y = 1
			else
				camera.Damping.x = 2.5
				camera.Damping.y = 3.9
			end
			_PlayerActiveSkillLogic_Teleport:TryDoingTeleport(user, teleport)
		end
	else
		if (teleport.CoolTimeEnd < now) then
			uc.Teleport = nil
			self:ResetCamera()
		end
	end
	return true
end
return false
end