return function (self,pt) 
if (not self:CheckLastRequestPortal()) then
	return
end
local mapName = self.Entity.CurrentMapName
local user = self.Entity
local u = user.WsUser
if (pt ~= nil) then
	if (u.ExclusiveAction) then
		return
	end
	if (u:IsDied()) then
		return
	end
	if (pt.Pt == _PortalType.Collision) then
		if (pt.Tm == "m999999999") then -- 더미 포탈
			return
		end
		self:TryEnterNormalPortal(pt)
	elseif (pt.Pt == _PortalType.CollisionScript) then
		if (pt.Script == "") then
			return
		end
		u.ExclusiveAction = true
		u:UsePortal(pt)
	end
end
end