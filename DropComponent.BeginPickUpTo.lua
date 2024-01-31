return function (self,target) 
-- self.ReservedDestroy = _UtilLogic.ElapsedSeconds + 5
if (isvalid(target)) then
	self.PickUpTarget = target
	local pet = target
	if (isvalid(pet.PetComponent)) then
		self.SpriteEntity.SpriteRendererComponent.OrderInLayer = 6
	end
	self:ChangeAnimation(10)
else
	self:BeginExpire()
end
end