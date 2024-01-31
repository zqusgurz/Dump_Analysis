return function (self,pt) 
local currentMap = self.Entity.CurrentMapName
if (currentMap == pt.Tm) then
	local portals = self.Entity.WsUser:GetPortals(currentMap, pt.Tn)
	if (#portals > 0) then
		if (_PlayerActiveSkillLogic_Teleport:TryRegisterTeleport(self.Entity, 0, 0, pt, portals[1], false)) then
			_SoundService:PlaySound(_EffectLogic.SoundGame["Portal"], 1)
		end
	end
else
	self.Entity.WsUser.ExclusiveAction = true
	self.Entity.WsUser:UsePortal(pt)
end
end