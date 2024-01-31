return function (self) 
local user = self.Entity
if (user.WsUser.ExclusiveAction) then
	return
end
if (not user.WsUser:IsAvailableInventoryOperation()) then
	return
end

--- FIXME Exclusive 디레이 대신 임시
--local cool = self._T.PickUpCool or 0
--local now = _UtilLogic.ElapsedSeconds
--if (now - cool < 0.1) then
--    return
--end
--self._T.PickUpCool = now
-------------------------------------

if (user.PlayerTemporaryStat:GetValue(_CTS.DarkSight) ~= 0) then
	return
end
local simulator = _CollisionService:GetSimulator(user)
local shape = BoxShape(user.TransformComponent.WorldPosition:ToVector2(), Vector2(0.22,0.35), 0)
local tb = {}
local count = simulator:OverlapAllFast(CollisionGroups.MapleDrop, shape, tb)
if (count == 0) then
	return
end
---@type DropComponent
local minimumDrop = nil
local minimumDropId = 0
for _,drop in pairs(tb) do
	---@type DropComponent
	local d = drop.Entity.DropComponent
	if (not isvalid(d)) then
		continue
	end
	local r = d.ReservedDestroy
	if (r == 0) then
		local dropId = d.DropId
		if (minimumDrop == nil or dropId < minimumDropId) then
			minimumDrop = d
			minimumDropId = dropId
		end
	end
end
if (minimumDrop ~= nil) then
	self:TryPick(minimumDrop)
end
end