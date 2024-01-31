return function (self,dropId,leaveType,pickup) 
local drop = self._clientDropMap[dropId]
if (drop == nil) then
	-- 퀘스트 아이템 등 정상적인 사유로 보이지 않게끔 맵에 등록되지 않은 드롭들도 포함.
	-- log_warning("no drop id", dropId)
	return
end
--log("remove drop ",dropId, " Leave type", leaveType)
---@type DropComponent
local dropComp = drop.DropComponent
dropComp.ReservedDestroy = _UtilLogic.ElapsedSeconds + 5
if (leaveType == _DropLeaveType.Expire) then
	dropComp:BeginExpire()
elseif (leaveType == _DropLeaveType.PickUp) then
	if (pickup.OwnerId == _UserService.LocalPlayer.OwnerId) then
		_SoundService:PlaySound(_UidMan:GetRawRUID("acf66093cbbe421398da26a335f9616e"), 1)
	end
	dropComp:BeginPickUpTo(pickup)
elseif (leaveType == _DropLeaveType.PickupPet) then
	local pet = pickup.PetOwnerComponent.Pet
	if (isvalid(pet)) then
		if (pickup.OwnerId == _UserService.LocalPlayer.OwnerId) then
			_SoundService:PlaySound(_UidMan:GetRawRUID("acf66093cbbe421398da26a335f9616e"), 1)
		end
		dropComp:BeginPickUpTo(pet)
	end
end
self._clientDropMap[dropId] = nil
end