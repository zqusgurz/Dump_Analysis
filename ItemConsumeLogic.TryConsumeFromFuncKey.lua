return function (self,itemId) 
local user = _UserService.LocalPlayer
if (user.WsUser:IsDied()) then
	return 0
end

local key = string.format("CON_%d", itemId)
local now = _UtilLogic.ElapsedSeconds
local time = self._T[key] or 0
if (now - time < 0.3) then
	return 0
end
self._T[key] = now

local pos = _InventoryLogic:FindItemPos(user.WsCharacterData, itemId)
if (pos ~= -1) then
	self:TryConsumeItem(2, pos)
end
return pos
end